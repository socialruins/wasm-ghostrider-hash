# Guide https://web.dev/emscripting-a-c-library/
DOCKER_IMAGE=trzeci/emscripten-fastcomp

mkdir -p lib/wasm-build
rm -rf js-lib/wasm-build/*

docker run \
  -v $(pwd):/src \
  -w="/src" \
  $DOCKER_IMAGE \
  emcc -O3 -s WASM=1 -s EXTRA_EXPORTED_RUNTIME_METHODS='["cwrap"]' -s MODULARIZE=1 \
        -s NODEJS_CATCH_EXIT=0 -s NODEJS_CATCH_REJECTION=0 \
        -I lib/ghostrider/ghostrider.c \
        lib/ghostrider/utils/aes_helper.c \
        lib/ghostrider/utils/extra.c \
        lib/ghostrider/utils/gost_streebog.c \
        lib/ghostrider/utils/lyra2.c \
        lib/ghostrider/utils/sph_blake.c \
        lib/ghostrider/utils/sph_bmw.c \
        lib/ghostrider/utils/sph_cubehash.c \
        lib/ghostrider/utils/sph_echo.c \
        lib/ghostrider/utils/sph_fugue.c \
        lib/ghostrider/utils/sph_groestl.c \
        lib/ghostrider/utils/sph_hamsi.c \
        lib/ghostrider/utils/sph_haval.c \
        lib/ghostrider/utils/sph_jh.c \
        lib/ghostrider/utils/sph_keccak.c \
        lib/ghostrider/utils/sph_luffa.c \
        lib/ghostrider/utils/sph_shabal.c \
        lib/ghostrider/utils/sph_shavite.c \
        lib/ghostrider/utils/sph_simd.c \
        lib/ghostrider/utils/sph_skein.c \
        lib/ghostrider/utils/sph_tiger.c \
        lib/ghostrider/utils/sph_whirlpool.c \
        lib/ghostrider/utils/sponge.c \
        lib/ghostrider/utils/cryptonote/cryptonight_dark_lite.c \
        lib/ghostrider/utils/cryptonote/cryptonight_dark.c \
        lib/ghostrider/utils/cryptonote/cryptonight_fast.c \
        lib/ghostrider/utils/cryptonote/cryptonight_lite.c \
        lib/ghostrider/utils/cryptonote/cryptonight_soft_shell.c \
        lib/ghostrider/utils/cryptonote/cryptonight_turtle_lite.c \
        lib/ghostrider/utils/cryptonote/cryptonight_turtle.c \
        lib/ghostrider/utils/cryptonote/cryptonight.c \
        lib/ghostrider/utils/crypto/aesb.c \
        lib/ghostrider/utils/crypto/c_blake256.c \
        lib/ghostrider/utils/crypto/c_groestl.c \
        lib/ghostrider/utils/crypto/c_jh.c \
        lib/ghostrider/utils/crypto/c_keccak.c \
        lib/ghostrider/utils/crypto/c_skein.c \
        lib/ghostrider/utils/crypto/hash.c \
        lib/ghostrider/utils/crypto/oaes_lib.c \
        lib/sha256d/sha256d.c \
        lib/sha256d/utils/sph_sha2.c \
        -o lib/wasm-build/ghostrider-hash.js

WASM_BUILD_BASE_64=$(base64 lib/wasm-build/ghostrider-hash.wasm)

# fs.readFile/fetch of `ghostrider-hash.wasm` isn't suitable for bundling into libraries
# Produce JS file with the wasm build base64 instead
echo 'module.exports = "'${WASM_BUILD_BASE_64}'"' > lib/wasm-build/ghostrider-hash-wasm-base64.js

# rm lib/wasm-build/ghostrider-hash.wasm
