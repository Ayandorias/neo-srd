#!/usr/bin/env python3
import re
import os
import sys

def flatten_typst(start_file):
    imports = set()
    visited_files = set()

    if not os.path.exists(start_file):
        print(f"[FEHLER] Die Startdatei '{start_file}' fehlt.", flush=True)
        return None

    def process_file(file_path, depth=0):
        abs_path = os.path.abspath(file_path)
        indent = "  " * depth
        
        if abs_path in visited_files:
            return f"\n// [BEREITS GELADEN: {os.path.basename(file_path)}]\n"
            
        visited_files.add(abs_path)
        print(f"{indent}[Lese] -> {os.path.basename(file_path)}", flush=True)
        
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                lines = f.readlines()
        except Exception as e:
            print(f"{indent}[FEHLER] Kann {file_path} nicht lesen: {e}", flush=True)
            return f"\n// [FEHLER BEIM LESEN: {os.path.basename(file_path)}]\n"
        
        processed_lines = []
        for line in lines:
            if line.strip().startswith('#import'):
                imports.add(line.strip())
            else:
                match = re.match(r'^\s*#include\s+"(.*?)"', line)
                if match:
                    included_file = match.group(1)
                    inc_path = os.path.join(os.path.dirname(file_path), included_file)
                    
                    if not os.path.exists(inc_path):
                         print(f"{indent}  [WARNUNG] Zieldatei fehlt: {inc_path}", flush=True)
                         processed_lines.append(f"\n// [FEHLENDES MODUL: {included_file}]\n")
                         continue
                         
                    processed_lines.append(f"\n// --- BEGIN MODUL: {included_file} ---\n")
                    processed_lines.append(process_file(inc_path, depth + 1))
                    processed_lines.append(f"\n// --- END MODUL: {included_file} ---\n")
                else:
                    processed_lines.append(line)
        
        visited_files.remove(abs_path)
        return "".join(processed_lines)

    print(f"--- Starte Flattening-Prozess ---", flush=True)
    main_content = process_file(start_file)
    
    print("\n--- Baue finale Datei zusammen ---", flush=True)
    
    final_output = "// GENERIERTER FLAT-EXPORT FUER KI-ANALYSE\n\n"
    final_output += "\n".join(sorted(list(imports))) + "\n\n"
    final_output += f"// --- BEGIN MAIN: {start_file} ---\n"
    final_output += main_content
    final_output += f"\n// --- END MAIN: {start_file} ---\n"
    
    return final_output

if __name__ == "__main__":
    output_file = 'sr_dokument_flat.typ'
    try:
        result = flatten_typst('neo-srd.typ')
        
        if result:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(result)
            print(f"\n[ERFOLG] Datei gespeichert als: {output_file}", flush=True)
        else:
            print("\n[ABBRUCH] Es wurde keine Datei generiert.", flush=True)
            sys.exit(1)
            
    except Exception as e:
        print(f"\n[KRITISCHER FEHLER] {e}", flush=True)
        sys.exit(1)
