#!/bin/bash
#script location /var/prtg/scriptsxml/gpu-0.sh

# Power use in Watts
power_draw=$(nvidia-smi -i 0 --query-gpu=power.draw --format=csv,noheader | cut -d ' ' -f 1)
# GPU Model - cannot capture text strings, so series and submodel info are stripped. ie. RTX2080ti reports as 2080
gpu_name=$(nvidia-smi -i 0 --query-gpu=gpu_name --format=csv,noheader | tr -dc '0-9')
# GPU Driver Version
driver_version=$(nvidia-smi -i 0 --query-gpu=driver_version --format=csv,noheader) 
# GPU Core Temperature in C
temperature_gpu=$(nvidia-smi -i 0 --query-gpu=temperature.gpu --format=csv,noheader) 
# GPU Graphics Clock Speed MHz
clocks_current_graphics=$(nvidia-smi -i 0 --query-gpu=clocks.current.graphics --format=csv,noheader | cut -d ' ' -f 1)
# GPU RAM Clock Speed MHz
clocks_current_memory=$(nvidia-smi -i 0 --query-gpu=clocks.current.memory --format=csv,noheader | cut -d ' ' -f 1)
# GPU Total Memory in MB
memory_total=$(nvidia-smi -i 0 --query-gpu=memory.total --format=csv,noheader | cut -d ' ' -f 1)
# GPU Used Memory in MB
memory_used=$(nvidia-smi -i 0 --query-gpu=memory.used --format=csv,noheader | cut -d ' ' -f 1)

# Format output in PRTG XML template
echo "<prtg> 

        <result> 
                <channel>GPU-0 Power Usage</channel> 
                <value>$power_draw</value>
                <float>1</float>
                <customunit>Watts</customunit>
        </result> 

        <result> 
                <channel>GPU-0 Series</channel> 
                <value>$gpu_name</value> 
                <float>1</float>
                <ShowChart>0</ShowChart>
        </result>

        <result> 
                <channel>GPU-0 Driver</channel> 
                <value>$driver_version</value> 
                <float>1</float>
                <ShowChart>0</ShowChart>
        </result> 

        <result> 
                <channel>GPU-0 Temperature</channel> 
                <value>$temperature_gpu</value> 
                <unit>temperature</unit>
        </result>

        <result> 
                <channel>GPU-0 Clock Speed</channel> 
                <value>$clocks_current_graphics</value>
                <customunit>MHz</customunit> 
        </result>

	<result> 
                <channel>GPU-0 Memory Speed</channel> 
                <value>$clocks_current_memory</value>
                <customunit>MHz</customunit> 
        </result> 

        <result> 
                <channel>GPU-0 Total Memory</channel> 
                <value>$memory_total</value> 
                <customunit>MB</customunit>
                <ShowChart>0</ShowChart>
        </result> 

        <result> 
                <channel>GPU-0 Used Memory</channel> 
                <value>$memory_used</value> 
                <customunit>MB</customunit>
        </result> 

</prtg>" 
