🛠️ Doomsday Cyberdeck
📘 Design Specification & Build Roadmap — Rev 0.1
Project type: Portable offline-first computer
Status: Early design / prototype planning
Current budget: $0
Design inspiration: DTeK DIY Raspberry Pi 5 cyberdeck
Primary objective: Build a modular portable computer that can access useful digital information and computing tools without relying on an internet connection.

🌎 1. Project Overview
The Doomsday Cyberdeck is a planned all-in-one offline computing station designed to combine local AI, offline reference materials, maps, radio, and everyday computing tools in one portable enclosure.

The system will use a larger rugged case with a large display, keyboard, modular computer, and space for multiple storage drives.

A local AI assistant called A.D.A. will help users search information, understand documents, and interact with supported local tools without requiring cloud AI services.

The project prioritizes:

🧠 Local AI computing
📚 Offline encyclopedia and technical manuals
🗺️ Offline maps and GPS support
📻 Radio reception
💾 Expandable storage and backups
🔧 Repairability and modular hardware
🔋 Reliable, safely designed power
🌐 Independence from internet access for core features
🎯 2. Main Requirements
Functional requirements
 🧠 Run a local AI model without an internet connection.
 📚 Browse downloaded reference materials and technical manuals.
 🔎 Search local documents and return relevant information.
 🗺️ Display downloaded maps offline.
 📍 Support a compatible GPS receiver for location information.
 📻 Support a compatible radio receiver.
 💾 Provide storage for software, AI models, maps, and reference archives.
 🛡️ Maintain a separate backup of important project data.
 🖥️ Provide a user interface for accessing the main tools.
 🔌 Allow compatible modules to be replaced or upgraded.
 🚫 Start and use the core system without Wi-Fi once the required software and data are installed.
Physical requirements
 🧳 Larger hard case with room for multiple storage drives.
 🖥️ Large display opening.
 ⌨️ Integrated or securely mounted keyboard.
 🧩 Removable internal mounting plate.
 🌬️ Adequate ventilation and cooling.
 🔩 Accessible mounting points and serviceable connectors.
 🔋 Protected power system designed for the selected components.
 📡 Space for radio/GPS connections where required.
Documentation requirements
 📐 Complete 3D CAD assembly.
 📦 Exported .STEP model and editable source files.
 ⚡ PCB source files and verified schematics, if custom PCBs are used.
 🧾 BOM in CSV format with component links, prices in USD, and shipping costs.
 💻 Relevant software or firmware source files.
 🖼️ Screenshots of the design and PCB, where applicable.
 🔌 Wiring diagram if the design uses wiring outside the PCBs.
 📝 Project notes and development logs.
 👥 Feedback from other people before submission.
These documentation items follow the Stardance guide supplied for this project. Check the current program rules before submitting.

🧱 3. Planned System Architecture
🧠 Main computer
Runs the operating system, A.D.A., maps, document search, and dashboard.

Candidate platforms: Raspberry Pi 5 or a compact mini PC. The final choice depends on measured performance, RAM, storage support, cooling, and power consumption.

💾 Storage subsystem
System storage: operating system, applications, and active AI model files.
Archive storage: encyclopedia, repair manuals, maps, and reference documents.
Backup storage: a separate copy of important files.
🖥️ User interface
Large display
Keyboard and pointing device
Main dashboard
Status indicators and accessible ports
📻 Radio and navigation
Compatible radio receiver
Suitable antenna and connectors
Compatible GPS receiver, if included
Offline mapping software
Radio reception and GPS positioning depend on suitable hardware, antennas, signal availability, and local conditions.

🔌 Power subsystem
A properly rated power solution for the selected computer, display, drives, and peripherals. Battery selection and power distribution will be finalized only after component requirements are known.

💻 4. Software Requirements
🧠 A.D.A. — Local AI
The existing A.D.A. project is the intended starting point.

Planned tasks:

Confirm the project files are available.
Set up the supported Python environment.
Install the required dependencies.
Confirm Ollama is running.
Verify that the selected local model responds.
Launch the simplest supported A.D.A. interface.
Test basic questions and local document workflows.
Improve error handling and document the limitations.
A local AI model can produce incorrect answers. Important information should be checked against the underlying reference material.

📚 Offline knowledge
Planned tools include:

Kiwix with suitable downloaded ZIM archives
A local PDF reader
A searchable folder of reference documents
Downloaded technical manuals
A record of source, date, size, and license for each dataset
🗺️ Maps and GPS
Planned tasks:

Select an offline mapping application.
Test it with downloaded map data.
Confirm it works with the network disconnected.
Add a compatible GPS receiver later.
Test location reporting and offline route planning.
📻 Radio
Planned tasks:

Decide whether FM reception alone is sufficient.
Select a compatible receiver module.
Verify driver and software support.
Plan antenna placement.
Test reception and controls once hardware is available.
🖥️ Dashboard
The dashboard will provide access to:

A.D.A.
Offline knowledge
Maps
Radio controls
Storage status
System information
The dashboard can be prototyped on the existing computer before the physical cyberdeck is assembled.

📐 5. CAD Design Plan
The initial concept uses a provisional enclosure of 360 × 280 mm with a larger screen opening.

The current screen opening concept is 270 × 170 mm. This is a target opening size, not a confirmed display model.

CAD components
 Main enclosure base
 Lid and display opening
 Display mounting points
 Keyboard mounting area
 Internal mounting plate
 Computer mounting points
 Storage-drive cradles
 Cooling openings
 Port and cable openings
 Hinge and latch clearances
 Service access and fasteners
CAD validation
Choose candidate components.
Obtain their real dimensions from manufacturer drawings.
Update the CAD to match those dimensions.
Check component collisions and cable clearances.
Check the lid closes without contacting the keyboard or electronics.
Verify cooling openings and service access.
Assemble all components into one CAD assembly.
Export a .STEP file.
Save screenshots of the complete model.
Important: the current CAD package is a preliminary concept. It is not yet a verified, complete manufacturing assembly.

⚡ 6. Custom PCB Plan
PCB A — Front-panel interface
Intended functions:

Four button connections
Four status LED channels
Connector for a compatible external logic controller
Current status: preliminary placement concept.

Required next steps:

Confirm the controller and GPIO voltage.
Select actual buttons, LEDs, resistors, and connectors.
Create a matching schematic.
Validate all footprints against datasheets.
Check signal and resistor connections.
Route copper.
Add mounting holes and board clearances.
Run electrical and PCB design-rule checks.
Request a design review.
Export manufacturing files only after verification.
PCB B — Power distribution
Planned function: distribute power to the computer and peripherals.

This board must be designed around the selected components' voltage, current, connector, and protection requirements. It is not designed or validated yet.

PCB C — Radio/GPS interface
Planned function: provide connectors and interface support for selected radio and GPS modules.

The exact circuit depends on the receiver hardware chosen later.

🪜 7. Step-by-Step Build Roadmap
Phase 1 — 🆓 Start with $0
 Find the existing A.D.A. project folder or ZIP.
 Check which development tools are already installed.
 Create a project folder for the cyberdeck.
 Record the current CAD and PCB files.
 Create a simple task checklist.
 Avoid buying hardware at this stage.
Milestone: a clearly organized project workspace.

Phase 2 — 🧠 Get A.D.A. running
 Open the extracted project folder.
 Confirm requirements.txt is present.
 Activate the intended Python environment.
 Install dependencies from the project directory.
 Confirm Ollama and the local model work.
 Run the simplest supported interface.
 Fix errors one at a time.
 Record what works and what still fails.
Milestone: a repeatable local AI demonstration on the existing computer.

Phase 3 — 📚 Build a small offline library
 Create the knowledge folders.
 Add a few legally obtained reference documents.
 Test opening and searching the documents.
 Test a suitable offline encyclopedia application.
 Disconnect the network and repeat the tests.
 Record any missing features or dependencies.
Milestone: useful reference material available without internet access.

Phase 4 — 📐 Complete the physical design
 Refine the enclosure CAD.
 Confirm the display dimensions.
 Place the computer, keyboard, and drives.
 Add mounting points, ventilation, and cable routes.
 Check component clearances.
 Export the full assembly as .STEP.
 Capture model screenshots.
Milestone: a documented, dimensionally consistent CAD assembly.

Phase 5 — ⚡ Validate custom electronics
 Finish the front-panel schematic.
 Validate component footprints.
 Route the front-panel PCB.
 Run KiCad design-rule checks.
 Obtain feedback from a knowledgeable reviewer.
 Develop power and receiver boards only after requirements are known.
 Prepare verified source files and manufacturing outputs.
Milestone: reviewed PCB designs suitable for fabrication quotations.

Phase 6 — 🧾 Prepare the funding package
 Create the CSV bill of materials.
 Include every required item, links, USD prices, and shipping.
 Separate essential components from optional upgrades.
 Document the CAD, PCB, and software status honestly.
 Get feedback from other people.
 Check the latest Stardance eligibility and submission rules.
 Submit the design for funding if it meets the current requirements.
Milestone: a complete, evidence-backed funding proposal.

Phase 7 — 🔧 Build after funding or donations
 Acquire only approved, compatible components.
 Check parts against the CAD before assembly.
 Review the power design before powering electronics.
 Assemble and test each subsystem separately.
 Integrate the computer, display, storage, and peripherals.
 Test cooling, connectivity, and safe shutdown.
 Verify offline operation.
 Document real assembly progress with devlogs and photos.
Milestone: a working physical prototype.

Phase 8 — 🚀 Final testing and project shipping
 Test startup without internet access.
 Test A.D.A. with the network disconnected.
 Open offline reference material.
 Browse downloaded maps.
 Verify GPS and radio features if installed.
 Check storage and backup behavior.
 Confirm CAD and PCB files match the final build.
 Write the README in your own words.
 Add genuine screenshots and a wiring diagram if applicable.
 Record a public demo video if required for the build submission.
 Submit only when all applicable requirements are satisfied.
🛡️ 8. Safety and Reliability
Use a professionally protected battery system and compatible charger.
Have a knowledgeable adult or qualified person review the power design.
Do not assemble lithium battery packs from loose cells as a beginner.
Verify voltage, current, polarity, connector ratings, and cooling before connecting hardware.
Keep a separate backup of important data.
Test offline operation rather than assuming every feature works without internet access.
Record known limitations and verify critical information from reliable sources.
🏁 9. Definition of Done
The project is considered complete only when the selected requirements have been demonstrated and documented.

The final cyberdeck should:

Run its core applications without internet access.
Provide access to stored reference material.
Run its local AI assistant within the chosen hardware's limits.
Display downloaded maps.
Support the selected radio and GPS hardware.
Store and back up important information.
Have a verified CAD assembly and documented electronics.
Have a tested power arrangement and adequate cooling.
Include complete project files, testing evidence, and a demonstration.
Current priority: get one piece working at a time, starting with A.D.A. on the computer you already have. No hardware purchases are required to begin the software prototype.
