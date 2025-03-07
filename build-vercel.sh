#!/bin/bash

# Build TypeScript declarations first
cd packages/payload && tsc --emitDeclarationOnly --outDir dist
cd ../translations && tsc --emitDeclarationOnly --outDir dist
cd ../graphql && tsc --emitDeclarationOnly --outDir dist
cd ../ui && tsc --emitDeclarationOnly --outDir dist

# Return to root and build all packages
cd ../..
pnpm build:packages

# Build the Next.js application
cross-env NODE_OPTIONS=--no-deprecation next build
