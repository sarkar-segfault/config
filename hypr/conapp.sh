#!/usr/bin/env bash
choice=$(fuzzel --dmenu --prompt-only="$ ") && bash -c "${choice}"
