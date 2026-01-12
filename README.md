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
<summary><strong>Longitudinal Control Laws</strong></summary>

The longituinal autopilot is handled in the below section of the model. The autopilot takes a commanded altitude, the rate of climb, current altitude, and a handling metric and outputs a elevator command. 

<img width="1694" height="673" alt="image" src="https://github.com/user-attachments/assets/d2467a78-97f3-4fd6-910e-9a0f36a7627c" />

Below is the longitudinal autopilot subsystem:

<img width="1448" height="775" alt="image" src="https://github.com/user-attachments/assets/b39f80d9-61e6-4d90-b033-3e56c720cdff" />

This subsystem calculates the error between the commanded altitude and the current altitude and passes it to an arctangent-based equation, shown in the plot below. In this equation, the x-axis represents the altitude error, and the y-axis represents the commanded rate of climb or descent. The equation is designed to produce smooth altitude transitions.

When the altitude error is large, the equation outputs a corresponding rate of climb or descent. The arctangent function is calibrated so that the commanded climb rate is always within a safe limit, preventing the aircraft from stalling—an issue that a traditional PID controller may encounter.

The term u(1) in the equation represents a handling quality metric. This metric stretches the arctangent curve along the y-axis, allowing the autopilot to achieve more aggressive altitude changes when necessary. Some of the maneuvers provided in the project required short periods of climb or descent that would exceed the default safe rates. Rather than discarding the equation, the handling metric was added to control the maximum commanded rate and the rate at which it changes.

Once the rate of climb (ROC) is calculated by the arctangent equation, the error between this commanded ROC and the current ROC is fed into a bounded PID controller.

<img width="2312" height="956" alt="image" src="https://github.com/user-attachments/assets/79e93f81-8ddc-4ac8-ad24-4929047dd86b" />

*Red is a handling value of 1, blue is 0.*

<img width="665" height="172" alt="image" src="https://github.com/user-attachments/assets/462fb71f-a499-466a-b4e0-e3df3dbb35a2" />

</details>

<details>
<summary><strong>Bank Angle Control Laws</strong></summary>

Description of lateral/directional control laws governing bank angle response. Below shows where the bank angle sybsystem is in the model. 

<img width="1647" height="426" alt="image" src="https://github.com/user-attachments/assets/741fe680-6869-497c-a0a7-9c07fdeb900d" />

The subsystem below is the **Bank Angle PID** subsystem. This takes heading error, current euler angles, and the handling qualities. This works in the same way as the longitudinal control law described above. Arguabley using an arctan is more important in bank angle to prevent the PID from commanding a 90 degree bank. This then produces a ailron command.

<img width="1930" height="618" alt="image" src="https://github.com/user-attachments/assets/e8d5b552-2548-44ea-b281-180f08db0c03" />

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

Automatic altitude scheduling and hold logic. The image below shows where the altitude scheduling and Hold are handled. 
[Altitude Schedule Video Demo](https://youtu.be/LaaLUl7r_I8)

<img width="1458" height="645" alt="image" src="https://github.com/user-attachments/assets/65a80ddb-ca31-47ab-b316-cb0717d53a26" />

As you see below the Alitude commands are handed directly to the longitudinal autopilot. This allows us to very easily create a time based altitude schedule or use a constant for a desired altitude request. 

<img width="1343" height="579" alt="image" src="https://github.com/user-attachments/assets/cc77bcfb-fc6e-46c5-8658-150bca09a496" />

</details>

<details>
<summary><strong>Bank Angle Scheduling & Hold</strong></summary>

Automatic bank angle scheduling and stabilization. The image below shows the general area where Bank angle is handled. 

<img width="1928" height="656" alt="image" src="https://github.com/user-attachments/assets/542b8b58-1446-4f42-976c-a45e1c27640d" />

The iimage below shows the 3 options for bank angle control. Either a direct ailron input, a given bank angle in degrees, or a desired heading. 

<img width="1666" height="630" alt="image" src="https://github.com/user-attachments/assets/9dde8271-99fa-430c-8bdf-1f168d6eae4a" />

Below is the **bank hold** subsystem. It is a simple bounded PID to produce the bank angle needed.

<img width="1268" height="287" alt="image" src="https://github.com/user-attachments/assets/083073d5-6e9a-435c-b3aa-f8e6e813a79c" />

Below is the **Desired & current heading to error** block. This is a simple subsystemm to calculate the error in the angle between the desired heading and the current heading. This is then passed to the Bank angle PID.

<img width="1606" height="713" alt="image" src="https://github.com/user-attachments/assets/9749bd01-4a42-40bd-86b1-b4b01950ecc8" />



</details>

# Misc Subsystems

<details>
<summary><strong>FlightGear Inputs</strong></summary>

Interface for FlightGear simulation inputs. The image below shows where it exists in the model. Importantly the GENFGRUN block generates the propper config file for flight gear. 

<img width="729" height="428" alt="image" src="https://github.com/user-attachments/assets/0f822cf0-99b5-400b-8920-6fc1c088ebee" />

Below is the FlightGear subsystem. The Z had to be flipped because of the difference in sign conventions between an aircraft reference frame and a global reference frame. Then it uses the Flat Earth to LLA block to produce the variables the FlightGear Preconfigured 6DoF Animation block needs. 
<img width="1751" height="477" alt="image" src="https://github.com/user-attachments/assets/539bf3bc-b3f9-47da-b9d0-a2d4bbe267ee" />



</details>
