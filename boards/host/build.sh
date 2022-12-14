#!/bin/sh

TOOLCHAIN="host" . "$PROJECT_ROOT/common.sh"

[ $NODEPS ] || TOOLCHAIN="$TOOLCHAIN" "$ROOT/build.sh" "libmusician"

TARGET_SOURCES="
	$PROJECT_ROOT/src/unity.c
"

TARGET_OBJECTS="$(OBJECTS "$TARGET_FLAGS" $TARGET_SOURCES)"

EXEC "$AR" -rcs "$LIB/$TARGET.a" $TARGET_OBJECTS
EXEC "$RANLIB" "$LIB/$TARGET.a"
