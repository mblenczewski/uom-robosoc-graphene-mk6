#!/bin/sh

TOOLCHAIN="host" . "$PROJECT_ROOT/common.sh"

[ $NODEPS ] || TOOLCHAIN="$TOOLCHAIN" "$ROOT/build.sh" "libgraphene"

TARGET_SOURCES="
	$PROJECT_ROOT/src/unity.c
"

TARGET_OBJECTS="$(OBJECTS "$TARGET_FLAGS" $TARGET_SOURCES)"

EXEC "$CC" -static -o "$BIN/$TARGET" $TARGET_OBJECTS $TARGET_FLAGS