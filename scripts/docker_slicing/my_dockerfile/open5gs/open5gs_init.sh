#!/bin/bash

# BSD 2-Clause License

# Copyright (c) 2020, Supreeth Herle
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright notice, this
#    list of conditions and the following disclaimer in the documentation
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

export LD_LIBRARY_PATH=/open5gs/install/lib/$(uname -m)-linux-gnu

if [[ -z "$COMPONENT_NAME" ]]; then
	echo "Error: COMPONENT_NAME environment variable not set"; exit 1;

elif [[ "$COMPONENT_NAME" =~ ^(ausf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/ausf/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-ausfd


# elif [[ "$COMPONENT_NAME" == "amf2" ]]; then
#     echo "Deploying component: '$COMPONENT_NAME'"
#     /mnt/amf2/amf2_init.sh && \
#     cd install/bin && ./open5gs-amfd



elif [[ "$COMPONENT_NAME" == "amf2" ]]; then
    echo "Deploying component : '$COMPONENT_NAME'"
    /mnt/amf/${COMPONENT_NAME}_init.sh  && \
    cd install/bin && ./open5gs-amfd -c ../etc/open5gs/amf2.yaml

	
elif [[ "$COMPONENT_NAME" == "amf" ]]; then
    echo "Deploying component: '$COMPONENT_NAME'"
    /mnt/amf/${COMPONENT_NAME}_init.sh  && \
    cd install/bin && ./open5gs-amfd




# elif [[ "$COMPONENT_NAME" =~ ^(amf[[:digit:]]*$) ]]; then
# 	echo "Deploying component: '$COMPONENT_NAME'"
# 	/mnt/amf/${COMPONENT_NAME}_init.sh  && \
# 	cd install/bin && ./open5gs-amfd







elif [[ "$COMPONENT_NAME" =~ ^(bsf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/bsf/${COMPONENT_NAME}_init.sh && sleep 10 && \
	cd install/bin && ./open5gs-bsfd
elif [[ "$COMPONENT_NAME" =~ ^(hss[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/hss/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && sleep 10 && ./open5gs-hssd
elif [[ "$COMPONENT_NAME" =~ ^(mme[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/mme/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-mmed
elif [[ "$COMPONENT_NAME" =~ ^(nrf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/nrf/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-nrfd
elif [[ "$COMPONENT_NAME" =~ ^(scp[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/scp/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-scpd
elif [[ "$COMPONENT_NAME" =~ ^(nssf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/nssf/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-nssfd
elif [[ "$COMPONENT_NAME" =~ ^(pcf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/pcf/${COMPONENT_NAME}_init.sh && sleep 10 && \
	cd install/bin && ./open5gs-pcfd
elif [[ "$COMPONENT_NAME" =~ ^(pcrf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/pcrf/${COMPONENT_NAME}_init.sh && sleep 10 && \
	cd install/bin && ./open5gs-pcrfd
elif [[ "$COMPONENT_NAME" =~ ^(sgwc[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/sgwc/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-sgwcd
elif [[ "$COMPONENT_NAME" =~ ^(sgwu[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/sgwu/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-sgwud



elif [[ "$COMPONENT_NAME" == "smf2" ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/smf/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-smfd -c ../etc/open5gs/smf2.yaml


elif [[ "$COMPONENT_NAME" =~ ^(smf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/smf/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-smfd


elif [[ "$COMPONENT_NAME" =~ ^(udm[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/udm/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-udmd
elif [[ "$COMPONENT_NAME" =~ ^(udr[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/udr/${COMPONENT_NAME}_init.sh && sleep 10 && \
	cd install/bin && ./open5gs-udrd



elif [[ "$COMPONENT_NAME" == "upf2" ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/upf/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-upfd ../etc/open5gs/upf2.yaml




elif [[ "$COMPONENT_NAME" =~ ^(upf[[:digit:]]*$) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	/mnt/upf/${COMPONENT_NAME}_init.sh  && \
	cd install/bin && ./open5gs-upfd


elif [[ "$COMPONENT_NAME" =~ ^(webui) ]]; then
	echo "Deploying component: '$COMPONENT_NAME'"
	sleep 10 && /mnt/webui/webui_init.sh
else
	echo "Error: Invalid component name: '$COMPONENT_NAME'"
fi

#kyabat hahfhdahfhaslj