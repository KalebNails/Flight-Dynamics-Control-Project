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

Support for Xbox controller input and mapping. **[Xbox Controller Demo](https://youtu.be/cOsSXi2NBvk)**

The image below shows where the Xbox Controller subsystem fits into the overall model. From the control we get Elevator, ailron, rudder, and throttle commands.

<img width="1338" height="887" alt="image" src="https://github.com/user-attachments/assets/9aa67031-712f-450a-a5c6-4b7b9e1806d9" />

The image below shows the Xbox controller subsystem. Notably, a simulated control-surface extension time is applied to the rudder, but not to the aileron or elevator. This design choice is driven by human factors considerations: an instantaneous full rudder deflection causes the aircraft to snap aggressively left or right, inducing a large uncommanded roll.

To mitigate this behavior, a finite extension rate is applied to rudder deflection, while allowing instantaneous retraction. Additionally, because the Xbox controller interprets trigger inputs as discrete signals, the left (−1) and right (+1) trigger inputs are integrated. This allows the user to set and maintain a throttle level without continuously holding either trigger.

<img width="1232" height="887" alt="image" src="https://github.com/user-attachments/assets/85c710f9-3bdc-4bba-9b5d-a19102a7f908" />


</details>

<details>
<summary><strong>Waypoint Control</strong></summary>

Autonomous navigation using predefined waypoints as seen in the image below.

**[Waypoint Video Demo](https://youtu.be/oyI0Aa2u-BQ)**

<img width="1602" height="876" alt="starpath" src="https://github.com/user-attachments/assets/27c0d707-3d30-4a2a-b1b5-c6683644bc27" />

The image above shows the XY graph of the aircraft throughout the flight. Below is an image of the simulink subsystem that goes through the waypoints. It will automatically move to the next waypoint as long as the aircraft is within 100ft of the current waypoint. These waypoints can include altitude.

<img width="1085" height="628" alt="waypointsystem" src="https://github.com/user-attachments/assets/5d8fe20b-d22e-4c34-baab-7e6748e4608e" />

Then this subsystem below is what takes the waypoint and calculates the relative heading. This is then passed into the bank angle control laws to command and ailron change.

<img width="919" height="514" alt="image" src="https://github.com/user-attachments/assets/f47976fb-3ff6-4612-b625-fdcac1124ebd" />

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

This is the subsystem waypoint calcultoor

</details>

<details>
<summary><strong>FlightGear Inputs</strong></summary>

Interface for FlightGear simulation inputs.

</details>
