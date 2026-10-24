# SPDX-License-Identifier: MIT

# Status light for the Agar mini (KBDfans' indicator code)
if(CONFIG_SHIELD_AGAR_MINI_BLE)
  zephyr_library()
  zephyr_library_include_directories(${APPLICATION_SOURCE_DIR}/include)
  zephyr_library_sources(boards/shields/agar_mini/src/indicator.c)
endif()
