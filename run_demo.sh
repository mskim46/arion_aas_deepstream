#!/bin/bash

echo "ARION AAS DeepStream Demo"
echo "========================="

# Set DeepStream path
DEEPSTREAM_PATH="/opt/nvidia/deepstream/deepstream-7.1"

# Check if DeepStream exists
if [ ! -d "$DEEPSTREAM_PATH" ]; then
    echo "✗ DeepStream not found at $DEEPSTREAM_PATH"
    exit 1
fi

# Check if sample video exists
if [ ! -f "samples/sample_720p.mp4" ]; then
    echo "✗ Sample video not found: samples/sample_720p.mp4"
    exit 1
fi

# Set environment variables
export GST_PLUGIN_PATH=$DEEPSTREAM_PATH/lib/gst-plugins/
export LD_LIBRARY_PATH=$DEEPSTREAM_PATH/lib:$LD_LIBRARY_PATH

echo "Video: samples/sample_720p.mp4"
echo "Model: ONNX - Car, Bicycle, Person, Road Sign"
echo "Press Ctrl+C to stop"
echo "========================="

# Run DeepStream
cd "$DEEPSTREAM_PATH"
./bin/deepstream-app -c /home/nvidia/arion_aas_deepstream/configs/demo_config.txt

echo "Demo completed!" 