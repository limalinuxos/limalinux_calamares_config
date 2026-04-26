/* === Calamares slideshow — LimaLinux (tema oscuro, acento esmeralda) ===
 * Inspirado en enfoques tipo Xero/CachyOS: diapositivas con mensaje claro, sin depender
 * de PNGs externos; logo opcional desde logo.png
 */
import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation
    property color bgTop: "#0a0f0d"
    property color bgBottom: "#0f1a15"
    property color accent: "#34d399"
    property color accentLine: "#14532d"
    property color textPrimary: "#ecfdf5"
    property color textMuted: "#a7f3d0"

    function nextSlide() {
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 9000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    function onActivate() {
        presentation.currentSlide = 0;
    }

    function onLeave() {
    }

    Slide {
        // Bienvenida
        Item {
            anchors.fill: parent
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: bgTop }
                    GradientStop { position: 1.0; color: bgBottom }
                }
            }
            Rectangle { anchors.top: parent.top; width: parent.width; height: 5; color: accentLine }
            Rectangle { anchors.top: parent.top; y: 5; width: parent.width; height: 2; color: accent }
            Column {
                width: parent.width * 0.86
                anchors.centerIn: parent
                spacing: 18
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "LimaLinux"
                    color: accent
                    font.pixelSize: 32
                    font.bold: true
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "Instalación sencilla, sistema Arch limpio y paquetes que tú controlas."
                    color: textPrimary
                    font.pixelSize: 20
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "Elige locale, teclado y particiones. Avanza con el botón Siguiente cuando estés listo."
                    color: textMuted
                    font.pixelSize: 16
                }
            }
        }
    }

    Slide {
        // Disco y particiones
        Item {
            anchors.fill: parent
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: bgTop }
                    GradientStop { position: 1.0; color: bgBottom }
                }
            }
            Rectangle { anchors.top: parent.top; width: parent.width; height: 5; color: accentLine }
            Rectangle { anchors.top: parent.top; y: 5; width: parent.width; height: 2; color: accent }
            Column {
                width: parent.width * 0.86
                anchors.centerIn: parent
                spacing: 14
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Discos y particiones"
                    color: accent
                    font.pixelSize: 28
                    font.bold: true
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Borra, encoge o crea particiones con cuidado. Revisa el disco correcto (NVMe, SATA) antes de aceptar."
                    color: textPrimary
                    font.pixelSize: 18
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Btrfs, ext4 o cifrado: decide según copias, rendimiento o privacidad."
                    color: textMuted
                    font.pixelSize: 16
                }
            }
        }
    }

    Slide {
        // Software
        Item {
            anchors.fill: parent
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: bgTop }
                    GradientStop { position: 1.0; color: bgBottom }
                }
            }
            Rectangle { anchors.top: parent.top; width: parent.width; height: 5; color: accentLine }
            Rectangle { anchors.top: parent.top; y: 5; width: parent.width; height: 2; color: accent }
            Column {
                width: parent.width * 0.86
                anchors.centerIn: parent
                spacing: 14
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Software y repositorios"
                    color: accent
                    font.pixelSize: 28
                    font.bold: true
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Añade grupos de paquetes o mantén un sistema mínimalista. Necesitas conexión para el catálogo en línea."
                    color: textPrimary
                    font.pixelSize: 18
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Un fallo con un paquete opcional no debería bloquear la instalación (non-critical)."
                    color: textMuted
                    font.pixelSize: 16
                }
            }
        }
    }

    Slide {
        // Cuenta
        Item {
            anchors.fill: parent
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: bgTop }
                    GradientStop { position: 1.0; color: bgBottom }
                }
            }
            Rectangle { anchors.top: parent.top; width: parent.width; height: 5; color: accentLine }
            Rectangle { anchors.top: parent.top; y: 5; width: parent.width; height: 2; color: accent }
            Column {
                width: parent.width * 0.86
                anchors.centerIn: parent
                spacing: 14
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Usuarios y red"
                    color: accent
                    font.pixelSize: 28
                    font.bold: true
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Crea tu usuario, contraseña e identidad del equipo. Más adelante el instalador aplica teclado y localización."
                    color: textPrimary
                    font.pixelSize: 18
                }
            }
        }
    }

    Slide {
        // Copia
        Item {
            anchors.fill: parent
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: bgTop }
                    GradientStop { position: 1.0; color: bgBottom }
                }
            }
            Rectangle { anchors.top: parent.top; width: parent.width; height: 5; color: accentLine }
            Rectangle { anchors.top: parent.top; y: 5; width: parent.width; height: 2; color: accent }
            Column {
                width: parent.width * 0.86
                anchors.centerIn: parent
                spacing: 14
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Copiando el sistema"
                    color: accent
                    font.pixelSize: 28
                    font.bold: true
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "Se descomprime la imagen raíz, se instalan paquetes y se configura el arranque (GRUB, initramfs)."
                    color: textPrimary
                    font.pixelSize: 18
                }
                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "No apagues el PC; al terminar, reinicia y quita el medio de instalación."
                    color: textMuted
                    font.pixelSize: 16
                }
            }
        }
    }

    Slide {
        // Logo
        Item {
            anchors.fill: parent
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: bgTop }
                    GradientStop { position: 1.0; color: bgBottom }
                }
            }
            Rectangle { anchors.top: parent.top; width: parent.width; height: 5; color: accentLine }
            Rectangle { anchors.top: parent.top; y: 5; width: parent.width; height: 2; color: accent }
            Column {
                width: parent.width * 0.9
                spacing: 20
                anchors.centerIn: parent
                Image {
                    source: "logo.png"
                    width: Math.min(parent.width * 0.28, 200)
                    height: width
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                    text: "Gracias por probar LimaLinux"
                    color: textPrimary
                    font.pixelSize: 22
                }
            }
        }
    }
}
