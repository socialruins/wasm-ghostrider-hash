# wasm-ghostrider-hash

[![NPM Version](https://img.shields.io/npm/v/wasm-ghostrider-hash)](https://www.npmjs.com/package/wasm-ghostrider-hash)
[![Build Status](https://github.com/socialruins/wasm-ghostrider-hash/actions/workflows/test_and_release.yml/badge.svg)](https://github.com/socialruins/wasm-ghostrider-hash/actions/workflows/test_and_release.yml)
[![Release Date](https://img.shields.io/github/release-date/socialruins/wasm-ghostrider-hash)](https://github.com/socialruins/wasm-ghostrider-hash/releases/latest)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen)](https://github.com/RichardLitt/standard-readme)

WASM binding for ghostrider hashing algorithm written in C

## Installation and usage

_[Buffer](https://github.com/feross/buffer) polyfill is required for usage in browsers_

- `$ npm install wasm-ghostrider-hash`

```javascript
const GhostRider = require("wasm-ghostrider-hash");

GhostRider().then((ghostrider) => {
  const hash = ghostrider.digest("hello world");
});
```

## Build and test

_Docker v20+ is required_

- `$ npm run build`
- `$ npm run test`
