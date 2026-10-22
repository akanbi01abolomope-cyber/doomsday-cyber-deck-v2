# Stardance / Doomsday Cyberdeck — Rev A

A practical starting package for a briefcase-style Raspberry Pi 5 cyberdeck. This is a **layout prototype**, not a verified production enclosure. Measure your actual hardware before printing, drilling, or ordering custom parts.

## What's in this folder?

- `cyberdeck_case_layout.scad` — editable OpenSCAD case/layout model.
- `control_panel.scad` — editable switch-panel model.
- `wiring_overview.svg` — wiring overview; open it in a browser or vector editor.
- `wiring_and_build_notes.md` — wiring and assembly notes.
- `BOM.csv` — parts list and planning notes.
- `README.md` — this guide.

## Current design assumptions

- Raspberry Pi 5, 8 GB target configuration.
- 13.3-inch main display; the cart listing suggests an HDMI/controller-board kit, but verify its actual connectors and power label.
- Separate power for the Pi and main display.
- One 2.5-inch SATA drive through a USB-to-SATA enclosure; no hot-swap bay or docking mechanism.
- External keyboard.
- 3-inch TFT status display with its own driver board. The exact input interface must be confirmed: an ST7701S/RGB panel is not automatically HDMI-compatible just because a board is included.
- USB GPS/GNSS receiver and a **receive-only** USB SDR radio are optional add-ons. The cart screenshots showed the GPS receiver, but did not clearly show an SDR receiver.
- Standoffs are not included as a purchase requirement because the builder already has some.

## 1. Open the CAD files

OpenSCAD files are **not** Python programs and do not run in Anaconda or Ollama.

1. Install OpenSCAD from <https://openscad.org/>.
2. Extract this ZIP to a normal folder.
3. Open `cyberdeck_case_layout.scad` in OpenSCAD.
4. Press **F5** for a preview or **F6** for a full render.
5. Edit the parameters near the top of the `.scad` file to adjust dimensions.
6. When dimensions have been checked against the real hardware, use **File → Export → Export as STL**.
7. Open `control_panel.scad` separately to preview/export the switch panel.

The current geometry uses approximate envelopes. Check screen outer size, thickness, mounting holes, cable exits, switch body depth, hinge clearance, and ventilation before manufacturing.

## 2. Local AI plan: Ollama

The AI is intended to run locally so the assistant can work without an internet connection **after Ollama and the model have been installed/downloaded**. Internet is still needed for initial installation, model downloads, and updating sources unless you transfer installers/models another way.

### Suggested first model

The existing development notes indicate that `qwen3:1.7b` was already downloaded on the Windows development computer. It is a small model suitable for testing the workflow; expect limited reasoning and avoid assuming it knows every fact. A Raspberry Pi 5 has much less compute than a desktop PC, so responses may be slow. Start with a small model and test it on the Pi before deciding how much AI work to assign to it.

### Install/check Ollama on Windows

1. Install Ollama from <https://ollama.com/download>.
2. Open PowerShell or Anaconda Prompt and check:

   ```powershell
   ollama --version
   ollama list
   ```

3. If `qwen3:1.7b` is already listed, you do not need to download it again. Otherwise, with internet access, run:

   ```powershell
   ollama pull qwen3:1.7b
   ```

4. Start a chat:

   ```powershell
   ollama run qwen3:1.7b
   ```

5. Type a prompt. Enter `/bye` to exit the chat.

Ollama normally runs a local API at `http://localhost:11434`. Keep it bound to the local machine unless you intentionally configure and secure network access.

## 3. Use Anaconda for Python tools

Anaconda is for the **Python dashboard / utility scripts**, not for opening `.scad` files or hosting the model itself. On Windows, open **Anaconda Prompt** in the project folder and run:

```powershell
conda create -n stardance python=3.11 -y
conda activate stardance
python -m pip install --upgrade pip
python -m pip install requests psutil
```

- `requests` lets a Python script call Ollama's local API.
- `psutil` can provide basic CPU/RAM/system statistics for a dashboard.

If you see `requirements.txt not found`, that means you are not in a folder containing that file. This Rev A package does not currently include a `requirements.txt`; the commands above install the small set of starter packages directly.

### Test Python → Ollama connection

With Ollama installed and running, save the following as `test_ollama.py` in your working folder:

```python
import requests

url = "http://localhost:11434/api/chat"
payload = {
    "model": "qwen3:1.7b",
    "messages": [
        {
            "role": "system",
            "content": (
                "You are Stardance, an offline cyberdeck helper. "
                "Be clear about uncertainty and prioritize safe, lawful uses."
            ),
        },
        {
            "role": "user",
            "content": "Give me a short status checklist for a portable computer.",
        },
    ],
    "stream": False,
}

response = requests.post(url, json=payload, timeout=180)
response.raise_for_status()
print(response.json()["message"]["content"])
```

Run it from the same activated environment:

```powershell
python test_ollama.py
```

If you get a connection error, open Ollama first and check `ollama list`. If the model name differs, use the exact name shown by `ollama list` in the script. If the response times out, try a smaller model or allow more time.

### Windows development vs. Raspberry Pi deployment

- **On Windows:** `localhost` means the Windows computer where Ollama is running.
- **On the cyberdeck:** install an ARM64-compatible Ollama build if available for the chosen Pi OS, then download the model on the Pi. Test model performance and memory use there. A model downloaded on Windows is not automatically installed on the Pi.
- If Python runs on the Pi and Ollama also runs on the Pi, keep the API URL as `http://localhost:11434`.
- If Python runs on the Pi but Ollama runs on another computer, the URL must point to that computer's LAN address, and network access must be deliberately enabled and secured. Do not expose the Ollama API directly to the public internet.

## 4. What the offline AI should do

Recommended first-stage features:

1. Answer general questions using the local model.
2. Help summarize **documents you have saved locally** (manuals, notes, and reference files).
3. Explain Linux/Python commands and basic troubleshooting.
4. Later, add local document search (RAG) so answers can cite the saved files rather than relying only on the model's built-in knowledge.
5. Show the model name and whether Ollama is reachable on the 3-inch status display.

**Important limitation:** Ollama by itself does not make Wikipedia, repair manuals, or maps available. Those datasets must be downloaded or copied onto the storage drive separately. A local model can make mistakes; verify critical repair, medical, navigation, and emergency information against trusted references.

## 5. Suggested project folder for future software

Keep the software separate from the CAD files so it is easier to test and maintain:

```text
stardance-software/
  README.md
  test_ollama.py
  dashboard.py          # add later
  requirements.txt      # create when dependencies are finalized
  data/
    manuals/             # locally saved reference files
    maps/                # offline map data
    notes/
```

Once the dashboard is written, activate the environment and run its actual entry-point file, for example `python dashboard.py`. **This package does not yet include `dashboard.py`**; `test_ollama.py` is a connection test, not the finished cyberdeck interface.

## 6. Power and hardware safety notes

- Verify the Pi 5 power source's actual USB-C output profile. A 5 V / 3 A bank may work for a reduced setup but can limit peripherals and cause undervoltage under load.
- Verify the display's input voltage, current, barrel size, and polarity from its label/manual before connecting power. Do not assume the two 12 V banks in the cart are compatible without checking their output and connector.
- HDMI carries video, not necessarily power. The 3-inch TFT's exact driver-board input and power requirements must be confirmed from the selected variant.
- Shut the Pi down through the operating system before removing its power or disconnecting the HDD to reduce the risk of file-system damage.
- Use standoffs or another secure, electrically insulating mount for exposed circuit boards. Foam can cushion the HDD enclosure or power bank, but must not cover ventilation, compress batteries, or contact exposed electronics in a way that could cause static or shorts.
- The SDR example is receive-only. It is not an emergency transmitter. Use radio receivers only for signals you are authorized to receive and follow local rules.

## 7. Before final fabrication

- Measure the actual 13.3-inch display and 3-inch TFT/driver board.
- Confirm all connector positions and power requirements.
- Confirm the HDD enclosure's dimensions and power connector.
- Check the physical depth of switches behind the panel.
- Test the Pi, displays, HDD, GPS, SDR, and power sources on a desk before installing them in the case.
- Revise the OpenSCAD dimensions after measurements. Do not treat Rev A as a fit-checked final enclosure.
