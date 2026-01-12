# Flight-Dynamics-Control-Project
This project was developed for my Dynamics & Controls course and implements a full aircraft control law based on a provided aircraft model. The system supports altitude scheduling and hold, waypoint navigation, bank angle hold, and manual control via an Xbox controller. All control outputs are exported to FlightGear for real-time visualization and animation.

**[View the Simulink Model (PDF)](Navion_6DoF_10_auto_ascend_2023.pdf)**

**Main Model:** Navioon_6DoF_10_auto_ascend_2023.mdl

**Main Model Image:** Navioon_6DoF_10_auto_ascend_2023.pdf

**Variable Initation File:** Navion_Geom_Temp.m

**Example Xbox Simulink Interface:** Xbox_controller.slx

## Youtube Demo Links:
1. Xbox Controller Demo:     https://youtu.be/cOsSXi2NBvk
2. Waypoint Demo:            https://youtu.be/oyI0Aa2u-BQ
3. Altitude Schedule Demo:   https://youtu.be/LaaLUl7r_I8

## **How to use:**
1. Run **Navion_Geom_Temp.m**
2. In Navioon_6DoF_10_auto_ascend_2023.mdl Use the **Generate Run Script** block to generate a runfg.bat file to generate a config file for flight gear.
3. Run **dos('runfg.bat')** in the MATLAB command line to iniate FlightGear. Tutorials exist on youtube if help is needed with the specifics of creating a runfg.bat file.
4. Run the simulink file

# Control Laws

<details>
<summary><strong>Bank Angle Control Laws</strong></summary>

Description of lateral/directional control laws governing bank angle response.

</details>

<details>
<summary><strong>Longitudinal Control Laws</strong></summary>

Description of pitch, altitude, and airspeed control behavior.

</details>

<details>
<summary><strong>Handling Quality (Commercial to Stunt)</strong></summary>

Explanation of handling quality modes and their operational envelopes.

</details>

# Autopilots & Capabilities

<details>
<summary><strong>Xbox Control</strong></summary>

Support for Xbox controller input and mapping.

</details>

<details>
<summary><strong>Waypoint Control</strong></summary>

Autonomous navigation using predefined waypoints.

</details>

<details>
<summary><strong>Altitude Scheduling & Hold</strong></summary>

Automatic altitude scheduling and hold logic.

</details>

<details>
<summary><strong>Bank Angle Scheduling & Hold</strong></summary>

Automatic bank angle scheduling and stabilization.

</details>

# Subsystems

<details>
<summary><strong>Waypoint Calculator</strong></summary>

Computes navigation paths and waypoint transitions.

</details>

<details>
<summary><strong>FlightGear Inputs</strong></summary>

Interface for FlightGear simulation inputs.

</details>
