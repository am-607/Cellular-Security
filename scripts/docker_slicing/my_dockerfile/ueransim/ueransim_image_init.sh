#!/bin/bash

# BSD 2-Clause License

# Copyright (c) 2020, Supreeth Herle
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

if [[ -z "$COMPONENT_NAME" ]]; then
	echo "Error: COMPONENT_NAME environment variable not set"; exit 1;



elif [[ "$COMPONENT_NAME" =~ ^(ueransim-gnb[[:digit:]]*$) ]]; then
	echo "Deploying componentsssss: '$COMPONENT_NAME'"
	/mnt/ueransim/${COMPONENT_NAME}_init.sh && \
	/UERANSIM/build/nr-gnb -c /UERANSIM/config/${COMPONENT_NAME}.yaml & \
	bash
	echo "finish componentss: '$COMPONENT_NAME'"


# elif [[ "$COMPONENT_NAME" =~ ^(ueransim-gnb[[:digit:]]*$) ]]; then
# 	echo "Deploying componentsssssssssssss: '$COMPONENT_NAME'"
# 	/mnt/ueransim/${COMPONENT_NAME}_init.sh && \
# 	./nr-gnb -c ../config/${COMPONENT_NAME}.yaml & \
# 	echo "finish componentssssssss: '$COMPONENT_NAME'"


elif [[ "$COMPONENT_NAME" == "ueransim-ue" ]]; then
	echo "Deploying component ueeeeeee: '$COMPONENT_NAME'"
	/mnt/ueransim/${COMPONENT_NAME}_init.sh && \
	/UERANSIM/build/nr-ue -c /UERANSIM/config/${COMPONENT_NAME}.yaml & \
	bash 
	echo "finishing ue1:'$COMPONENT_NAME'"



elif [[ "$COMPONENT_NAME" == "ueransim-ue2" ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/ueransim/${COMPONENT_NAME}_init.sh && \
	/UERANSIM/build/nr-ue -c /UERANSIM/config/${COMPONENT_NAME}.yaml & \
	bash
	echo "finishing ue2:'$COMPONENT_NAME'"


	
else
	echo "Error: Invalid component name: '$COMPONENT_NAME'"
fi

# hello