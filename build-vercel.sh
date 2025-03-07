#!/bin/bash

# Build TypeScript declarations using project references
echo "Building TypeScript declarations..."
cd packages/payload && pnpm tsc -b && cd ../..
cd packages/translations && pnpm tsc -b && cd ../..
cd packages/graphql && pnpm tsc -b && cd ../..
cd packages/ui && pnpm tsc -b && cd ../..
cd packages/next && pnpm tsc -b && cd ../..

# Build all packages
echo "Building all packages..."
pnpm build:packages

# Build the Next.js application
echo "Building Next.js application..."
cross-env NODE_OPTIONS=--no-deprecation next build
