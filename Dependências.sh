#Dependências:

#Arquivos importantes para instalar o aur no ArchMinimal
sudo pacman -S --needed --noconfirm base-devel fakeroot archlinux-xdg-menu


# Criaçao das Pastas User
sudo pacman -S --needed --noconfirm xdg-user-dirs xdg-user-dirs-gtk
xdg-user-dirs-update


# Codecs de Audio
sudo pacman -S --needed --noconfirm pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber gstreamer gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg


# AUR
git clone https://aur.archlinux.org/yay
cd yay/
makepkg -si
cd ..
rm -rf yay/


# Pacote Loginmanager
sudo pacman -S --needed --noconfirm greetd


# Pacotes Hyprland
sudo pacman -S --needed --noconfirm hyprland hyprlock hypridle hyprcursor waybar hyprlock hypridle hyprpaper
yay -S --noconfirm hyprshot
yay -S --noconfirm wlogout #Tela de Logout User


# Terminal
sudo pacman -S --needed --noconfirm kitty


# Gerenciador de Aplicativos
sudo pacman -S --needed --noconfirm rofi-wayland


# Gerenciador de Arquivos
sudo pacman -S --needed --noconfirm dolphin dolphin-plugins ark kio-admin kde-cli-tools


# Polkit
sudo pacman -S --needed --noconfirm polkit-kde-agent


# Compatibilidade QT e XDG com Wayland
sudo pacman -S --needed --noconfirm qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk


#Instalação dos temas para QT e GTK
sudo pacman -S --needed --noconfirm breeze breeze5 breeze-gtk paipurs-icon-theme


#Ferramentas de Alteração de temas
sudo pacman -S --needed --noconfirm nwg-look
yay -S --noconfirm qt5ct-kde qt6ct-kde


# Pacotes de Fontes
sudo pacman -S --needed --noconfirm ttf-font-awesome ttf-jetbrains-mono-nerd noto-fonts-cjk


#Gerenciador de Senhas
sudo pacman -S --needed --noconfirm gnome-keyring


# Diversos
sudo pacman -S --needed --noconfirm dunst cliphist vlc firefox pavucontrol fastfetch brightnessctl
yay -S --noconfirm qview


# Habilitar Serviços
systemctl --user enable pipewire pipewire-pulse wireplumber
sudo systemctl enable greetd


#Diversos Pós Instalação
sudo pacman -S --needed --noconfirm flatpak cava 


shutdown -r now
