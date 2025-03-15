########################
# install pget
curl -o /usr/local/bin/pget -L "https://github.com/replicate/pget/releases/latest/download/pget_$(uname -s)_$(uname -m)"
chmod +x /usr/local/bin/pget


########################
# get manifest and run pget - pget is a fast parallel file getter
cd /workspace/
wget https://raw.githubusercontent.com/ianscrivener/ai-dock-comfyui/refs/heads/main/pget_manifest.txt
pget multifile pget_manifest.txt

 
########################
# install custom nodes
cd /workspace/ComfyUI/custom_nodes 
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts
git clone https://github.com/rgthree/rgthree-comfy
git clone https://github.com/jags111/efficiency-nodes-comfyui
git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes
git clone https://github.com/cubiq/ComfyUI_essentials
git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack
git clone https://github.com/cubiq/ComfyUI_FaceAnalysis
git clone https://github.com/mav-rik/facerestore_cf
git clone https://github.com/ltdrdata/ComfyUI-Impact-Subpack
git clone https://github.com/shingo1228/ComfyUI-SDXL-EmptyLatentImage
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack


 