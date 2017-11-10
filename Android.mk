BASE_PATH := $(call my-dir)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	src/lib_json/json_reader.cpp \
	chromium-overrides/src/lib_json/json_value.cpp \
	src/lib_json/json_writer.cpp

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/chromium-overrides/include \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/src/lib_json

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	$(LOCAL_PATH)/chromium-overrides/include \
	$(LOCAL_PATH)/include

LOCAL_CFLAGS := \
	-DJSON_USE_EXCEPTION=0

LOCAL_MODULE := \
	libjsoncpp

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_C_INCLUDES += bionic		# very important!
LOCAL_C_INCLUDES += external/stlport/stlport
LOCAL_SHARED_LIBRARIES += libstlport
endif

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := eng

include $(BUILD_SHARED_LIBRARY)
