#!/bin/bash
source=("" "MBS010" "BSW101" "BSW102" "MBS011" "BSW111" "BSW112" "BSW113" "BSW114" "MBS012" "BSW121" "BSW122" "MBS013" "BSW131" "BSW132" "MBS014" "BSW141" "BSW142" "MBS015" "BSW151" "BSW152" "MBS016" "BLANK" "BLANK" "MBS017" "BLANK" "BLANK" "MBS018" "BSW181" "BSW182" "BSW183" "BSW184"  "MBS019" "BSW191" "BSW192" "BSW193" "BSW194" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK" "BLANK") 
for ((i=1; i < ${#source[@]}; i++))
do
  echo Starting ${source[i]}
  config -s config.ports.port$i.speed=9600
  config -s config.ports.port$i.parity=None
  config -s config.ports.port$i.charsize=8
  config -s config.ports.port$i.stop=1
  config -s config.ports.port$i.label=${source[i]}
  config -s config.ports.port$i.loglevel=0
  config -s config.ports.port$i.sdt.ssh=on
  done
config -r serialconfig