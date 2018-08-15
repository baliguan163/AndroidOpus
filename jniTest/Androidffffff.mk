LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

MY_MODULE_DIR       := opus
LOCAL_MODULE        := $(MY_MODULE_DIR)

include  $(LOCAL_PATH)/$(MY_MODULE_DIR)/celt_sources.mk   #加载celt 所有.c的 mk
include  $(LOCAL_PATH)/$(MY_MODULE_DIR)/silk_sources.mk   #加载silk 所有.c 的mk
include  $(LOCAL_PATH)/$(MY_MODULE_DIR)/opus_sources.mk   #加载opus 所有.c 的mk

SILK_SOURCES += $(SILK_SOURCES_FIXED)
CELT_SOURCES += $(CELT_SOURCES_ARM)
SILK_SOURCES += $(SILK_SOURCES_ARM)


#LOCAL_SRC_FILES     :=  \
#    $(subst $(ROOT_DIR)/$(MY_MODULE_DIR)/,,$(wildcard $(ROOT_DIR)/$(MY_MODULE_DIR)/src/*.c*)) \
#    $(subst $(ROOT_DIR)/$(MY_MODULE_DIR)/,,$(wildcard $(ROOT_DIR)/$(MY_MODULE_DIR)/celt/*.c*)) \
#    $(subst $(ROOT_DIR)/$(MY_MODULE_DIR)/,,$(wildcard $(ROOT_DIR)/$(MY_MODULE_DIR)/silk/*.c*)) \
#    $(subst $(ROOT_DIR)/$(MY_MODULE_DIR)/,,$(wildcard $(ROOT_DIR)/$(MY_MODULE_DIR)/silk/float/*.c*)) \
#    $(subst $(ROOT_DIR)/$(MY_MODULE_DIR)/,,$(wildcard $(ROOT_DIR)/$(MY_MODULE_DIR)/silk/fixed/*.c*))
LOCAL_SRC_FILES  := opusmain.c \
$(CELT_SOURCES)  \
$(SILK_SOURCES)  \
$(OPUS_SOURCES)  \

LOCAL_LDLIBS        := -lm -llog
LOCAL_C_INCLUDES    := \
    $(ROOT_DIR)/$(MY_MODULE_DIR)/src \
    $(ROOT_DIR)/$(MY_MODULE_DIR)/silk \
    $(ROOT_DIR)/$(MY_MODULE_DIR)/silk/fixed \
    $(ROOT_DIR)/$(MY_MODULE_DIR)/silk/float \
    $(ROOT_DIR)/$(MY_MODULE_DIR)/celt
    
LOCAL_CFLAGS        := -DNULL=0 -DSOCKLEN_T=socklen_t -DLOCALE_NOT_USED -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64
LOCAL_CFLAGS        += -Drestrict='' -D__EMX__ -DOPUS_BUILD -DUSE_ALLOCA -DHAVE_LRINT -DHAVE_LRINTF -O3 -fno-math-errno
#LOCAL_CFLAGS        += -DFIXED_POINT
LOCAL_CPPFLAGS      := -DBSD=1
LOCAL_CPPFLAGS      += -ffast-math -O3 -funroll-loops

include $(BUILD_SHARED_LIBRARY)
#LOCAL_PRELINK_MODULE := false
#include $(BUILD_STATIC_LIBRARY)
#
#include $(CLEAR_VARS)
#
#LOCAL_MODULE := myopus
#LOCAL_C_INCLUDES += \
#    $(JNI_H_INCLUDE) \
#    $(MY_MODULE_DIR) \
#    
#LOCAL_SRC_FILES := opusmain.c
#LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
#
#LOCAL_STATIC_LIBRARIES := opus
#LOCAL_PRELINK_MODULE := false
#
#include $(BUILD_SHARED_LIBRARY)





