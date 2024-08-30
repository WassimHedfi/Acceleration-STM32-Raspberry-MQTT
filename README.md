# 🖥️ Raspberry Pi MQTT Dashboard

## Overview

This project demonstrates the integration of a Raspberry Pi 4 with an MQTT broker ([ThingsBoard platform](https://thingsboard.io/)) to monitor system resources and sensor data. The system retrieves data from UART-connected devices and internal Raspberry Pi metrics (CPU, RAM, Disk usage, etc.), visualizing it through a customizable dashboard on ThingsBoard. Additionally, an RPC (Remote Procedure Call) mechanism is implemented to trigger specific actions on the Raspberry Pi remotely.

## Project Structure

- **[`main_py_sendUARTdata.py`](main_py_sendUARTdata.py)**: 🐍 Python script responsible for reading data from the UART interface and sending it to the MQTT broker. The script also gathers system metrics such as CPU usage, memory usage, and disk space, publishing them to the MQTT broker for real-time monitoring.
  
- **[`pi4_dashboard_mqtt.json`](pi4_dashboard_mqtt.json)**: 📊 JSON configuration file for setting up the ThingsBoard dashboard. This file defines the widgets and data sources used to display real-time data on the dashboard, including CPU usage, RAM usage, accelerometer data, and more.

- **[`acc_ADXL.pde`](acc_ADXL.pde)**: ✈️ Processing script that visualizes the orientation of a plane in real-time based on accelerometer data. This script communicates with the Raspberry Pi, receiving data via MQTT and updating the plane's orientation accordingly.

## Features

1. **Real-Time Monitoring**: ⏱️ The system monitors various system metrics (CPU, RAM, disk usage) and accelerometer data, publishing it to the MQTT broker for real-time visualization on the ThingsBoard dashboard.

2. **Customizable Dashboard**: 🛠️ The [`pi4_dashboard_mqtt.json`](pi4_dashboard_mqtt.json) file provides a pre-configured dashboard that includes widgets for visualizing system metrics and sensor data. Users can easily customize this dashboard according to their requirements.

3. **Remote Procedure Call (RPC)**: 📡 The project includes an RPC mechanism allowing remote triggering of specific actions on the Raspberry Pi, such as forcing the retrieval of telemetry data.

4. **3D Visualization**: 🎨 The [`acc_ADXL.pde`](acc_ADXL.pde) script offers a 3D visualization of the plane’s orientation based on real-time accelerometer data, providing a graphical representation of the sensor's output.

## Getting Started

### Prerequisites

- Raspberry Pi 4 with Python installed.
- UART-connected device for accelerometer data (or similar).
- Access to a ThingsBoard server with MQTT broker capabilities.
- [Processing IDE](https://processing.org/download/) for running the [`acc_ADXL.pde`](acc_ADXL.pde) script.

### Setup Instructions

1. **Install Required Libraries**:
   ```bash
   pip install paho-mqtt
   ```

2. **Configure UART Interface**: Ensure your UART-connected device is properly configured to communicate with the Raspberry Pi.

3. **Run the Python Script**:
   ```bash
   python3 main_py_sendUARTdata.py
   ```
   This script will begin reading data from the UART interface and system metrics, publishing them to the MQTT broker.

4. **Deploy the Dashboard**:
   - Import the `pi4_dashboard_mqtt.json` file into your [ThingsBoard instance](https://thingsboard.io/docs/devices-library/raspberry-pi-4/?minicomputersDashboard=importedDashboard).
   - Assign the correct data sources and configure any additional widgets as needed.

5. **Run the Plane Visualizer**:
   - Open the `acc_ADXL.pde` file in the Processing IDE.
   - Run the sketch to visualize the accelerometer data in real-time.

## Future Enhancements

- **Expand Sensor Integration**: 📈 Incorporate additional sensors to monitor environmental factors like temperature, humidity, etc.
- **Extended RPC Capabilities**: ⚙️ Enhance the RPC functionality to include more complex remote operations, such as system diagnostics or updates.

