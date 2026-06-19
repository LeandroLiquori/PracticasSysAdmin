#!/bin/bash

UsoCpu=$(top -bn1 | grep "Cpu" | awk '{print 100 - $8}')

DiskInfo=$(df -h | awk '$NF == "/" {print}')
SizeDisk=$(echo "$DiskInfo" | awk '{print $2}')
UsedDisk=$(echo "$DiskInfo" | awk '{print $3}')
UsedPorDisk=$(echo "$DiskInfo" | awk '{print $5}')

UsoMem=$(free -m | grep -i 'mem' | awk '{print $3*100/$2"%"}')

CpuUtilization=$(ps -eo pid,%cpu,comm --sort=-%cpu | head -n 6)
MemoryUtilization=$(ps -eo pid,%mem,comm --sort=-%mem | head -n 6)

echo "Tiempo de ejecucion sin descanso del sistema: "
uptime | awk '{print $3}' 

echo ======================== Recursos del Sistema ==========================
echo "UsoCPU: $UsoCpu%"
echo "UsoMemoria: $UsoMem"
echo "Total de disco: $SizeDisk
Disco en uso: $UsedDisk 
Porcentaje de uso:$UsedPorDisk"
echo ========================================================================

echo ================= Top five procesos altos del sistema ==================
echo "MEMORIA:
$MemoryUtilization.
CPU: 
$CpuUtilization"
echo ========================================================================
