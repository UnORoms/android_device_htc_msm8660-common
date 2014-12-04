#
# system_prop.mk for msm8660-common
#

# radio
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=rmnet0 \
    rild.libpath=/system/lib/libhtc_ril.so \
