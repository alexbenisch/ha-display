# ha-display

ESPHome firmware and LVGL UI for the GUITION JC8012P4A1C touchscreen displaying a Home Assistant dashboard.

## Hardware

- **Display:** GUITION JC8012P4A1C — 10.1" IPS, 800×1280, 10-point capacitive touch
- **SoC:** ESP32-P4NRW32 (dual-core RISC-V, 400 MHz, 32 MB PSRAM, 16 MB Flash)
- **Wireless:** ESP32-C6 co-processor (WiFi 6, BLE 5)

## Repo structure

```
esphome/ha-display.yaml   # Main ESPHome config
esphome/secrets.yaml      # WiFi/API credentials (gitignored, see secrets.yaml.example)
```

## Related repos

| Repo | Description |
|------|-------------|
| [alexbenisch/ha-config](https://github.com/alexbenisch/ha-config) | Home Assistant configuration — automations, dashboards, packages |

## Flashing

OTA (device must be on the network):

```bash
esphome run esphome/ha-display.yaml --device 192.168.178.101
```

First flash via USB-C UART port.

## HA dependencies

The display subscribes to these HA entities (all REST-polled, defined in `ha-config/packages/lumentree.yaml`):

- `sensor.lumentree800_output` — inverter AC output (W)
- `sensor.lumentree800_temperature` — inverter temperature (°C)
- `sensor.lumentree800_meter` — grid meter reading (W)
- `sensor.lumentree800_battery_voltage` — battery voltage (V)
- `sensor.lumentree800_grid_voltage` — grid voltage (V)
- `sensor.lumentree_power_limit` — active power limit (W)
- `sensor.lumentree800_inverter_ertrag_heute` — daily yield (kWh)
- `sensor.akku_master` / `sensor.akku_slave` — battery SoC (%)
- `sensor.lesekopf_hinterhaus_hinterhaus_bezug_heute` — daily grid import (kWh)
