#!/bin/bash

# Must exit and fail to build if any command fails
set -eo pipefail
umask 002

# Use this layer to add nodes and models

APT_PACKAGES=(
    "jq"
)
# Packages are installed after nodes so we can fix them...
PIP_PACKAGES=(
    "opencv-python==4.7.0.72"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    "https://github.com/jags111/efficiency-nodes-comfyui"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/chrisgoringe/cg-use-everywhere"
    "https://github.com/ltdrdata/ComfyUI-Inspire-Pack"
    "https://github.com/cubiq/ComfyUI_FaceAnalysis"
    "https://github.com/mav-rik/facerestore_cf"
    "https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/ltdrdata/ComfyUI-Impact-Subpack"
    "https://github.com/alt-key-project/comfyui-dream-project"
    "https://github.com/shingo1228/ComfyUI-SDXL-EmptyLatentImage"
    "https://github.com/jax-explorer/comfyui-model-dynamic-loader"
    "https://github.com/modusCell/ComfyUI-dimension-node-modusCell"
    "https://github.com/changwook987/ComfyUI-Small-Utility"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    
)

CHECKPOINT_MODELS=(
    #  SD1.5
    # RealisticVison6.safetensors SD1.5
    # "https://civitai.com/api/download/models/245598"    

    # SDXL
    # Socamerge-TurboXL-1.2-Hybrid.safetensors"
    "https://civitai.com/api/download/models/274815"      

    # TurboVisionXL-v4.3.1-VAE.safetensors
    # "https://civitai.com/api/download/models/273102"    

    # realvisxl-v50
    # https://civitai.com/api/download/models/798204       
    
    # realvisxl-v50 inpaint
    # https://civitai.com/api/download/models/967238       

    # Flux
    # Flux Acorn-Flux-v1.5-FP8.safetensors
    # "https://civitai.com/api/download/models/1374658"     
    
    # "https://huggingface.co/black-forest-labs/FLUX.1-Redux-dev/blob/main/flux1-redux-dev.safetensors"
    # "https://huggingface.co/black-forest-labs/FLUX.1-Fill-dev/resolve/main/flux1-fill-dev.safetensors"

)

UNET_MODELS=(

)

LORA_MODELS=(
    # SD 1.5
    # "https://civitai.com/api/download/models/16576"      # 
    # "https://civitai.com/api/download/models/62833"      # add_detail.safetensors"
    # "https://civitai.com/api/download/models/63006"      # LowRA.safetensors"
    # "https://civitai.com/api/download/models/16576"      # epi_noiseoffset2.safetensors"
    # "https://civitai.com/api/download/models/134104"     # CoolTones.safetensors"
    # "https://civitai.com/api/download/models/99602"      # GodPussy4.safetensors"
    # "https://civitai.com/api/download/models/288978"     # Landing_Strip.safetensors"
    # "https://civitai.com/api/download/models/128461"     # Perfect Eyes XL.safetensors"
    # "https://civitai.com/api/download/models/190920"     # Real Pussy - Lily v5.safetensors"

    # SDXL
    # "https://civitai.com/api/download/models/224006"         # conical nipples XL.safetensors"
    # "https://civitai.com/api/download/models/298576"          
    # "https://civitai.com/api/download/models/196559"          # puffy nipples SDXL
    # "https://civitai.com/api/download/models/871108"          # Real
    # "https://civitai.com/api/download/models/802232"          # Real Pussy - Cameltoe
    # "https://civitai.com/api/download/models/339112"          # Better Faces LoRA
)

VAE_MODELS=(
    #"https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    # "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    # "https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth"
    # "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    # "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
    # "https://huggingface.co/gemasai/4x_NMKD-Superscale-SP_178000_G/resolve/main/4x_NMKD-Superscale-SP_178000_G.pth"
)

CONTROLNET_MODELS=(
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    #"https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function build_extra_start() {
    build_extra_get_apt_packages
    build_extra_get_nodes
    build_extra_get_pip_packages
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/unet" \
        "${UNET_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
     
    cd /opt/ComfyUI
    source "$COMFYUI_VENV/bin/activate"
    LD_PRELOAD=libtcmalloc.so python main.py \
        --cpu \
        --listen 127.0.0.1 \
        --port 11404 \
        --disable-auto-launch \
        --quick-test-for-ci
    deactivate
}

function build_extra_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    "$COMFYUI_VENV_PIP" install --no-cache-dir \
                        -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                "$COMFYUI_VENV_PIP" install --no-cache-dir \
                    -r "${requirements}"
            fi
        fi
    done
}

function build_extra_get_apt_packages() {
    if [ ${#APT_PACKAGES[@]} -gt 0 ]; then
        $APT_INSTALL ${APT_PACKAGES[*]}
    fi
}
function build_extra_get_pip_packages() {
    if [ ${#PIP_PACKAGES[@]} -gt 0 ]; then
        "$COMFYUI_VENV_PIP" install --no-cache-dir \
            ${PIP_PACKAGES[*]}
    fi
}

function build_extra_get_models() {
    if [[ -n $2 ]]; then
        dir="$1"
        mkdir -p "$dir"
        shift
        arr=("$@")
        
        printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
        for url in "${arr[@]}"; do
            printf "Downloading: %s\n" "${url}"
            build_extra_download "${url}" "${dir}"
            printf "\n"
        done
    fi
}

# Download from $1 URL to $2 file path
function build_extra_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

umask 002

build_extra_start
fix-permissions.sh -o container
