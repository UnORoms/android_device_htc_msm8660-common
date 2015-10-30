# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

BOARD_VENDOR := htc

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm8660-common/include

# Bootloader
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/htc/msm8660

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a8
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_NEEDS_NON_PIE_SUPPORT := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_QCOM_BSP := true

# Audio
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_QCOM_TUNNEL_LPA_ENABLED := false
BOARD_QCOM_VOIP_ENABLED := false
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DNEED_SINGLETON_SENSORMANAGER
USE_DEVICE_SPECIFIC_CAMERA := true

# Filesystem
BOARD_VOLD_MAX_PARTITIONS := 36

# FM Radio
# 4.2 -> commenting these for audio policy
#BOARD_HAVE_QCOM_FM := true
#QCOM_FM_ENABLED := true 
#COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED
#BOARD_HAVE_FM_RADIO := true
#AUDIO_FEATURE_ENABLED_FM := true 

# GPS
TARGET_GPS_HAL_PATH := $(LOCAL_PATH)/gps
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_EGL_CFG := device/htc/msm8660-common/configs/egl.cfg
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Ril
BOARD_RIL_CLASS := ../../../device/htc/msm8660-common/ril
TARGET_RIL_VARIANT := caf

# Use CM PowerHAL
TARGET_POWERHAL_VARIANT := cm

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Media
TARGET_NO_ADAPTIVE_PLAYBACK := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
   ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
   endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true
