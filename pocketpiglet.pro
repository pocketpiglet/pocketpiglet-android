TEMPLATE = app
TARGET = pocketpiglet

QT += quick quickcontrols2 sql multimedia sensors purchasing
CONFIG += c++17 resources_big

DEFINES += QT_DEPRECATED_WARNINGS QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

INCLUDEPATH += \
    3rdparty/webrtc/common_audio/vad/include

SOURCES += \
    3rdparty/webrtc/common_audio/signal_processing/division_operations.c \
    3rdparty/webrtc/common_audio/signal_processing/energy.c \
    3rdparty/webrtc/common_audio/signal_processing/get_scaling_square.c \
    3rdparty/webrtc/common_audio/signal_processing/resample_48khz.c \
    3rdparty/webrtc/common_audio/signal_processing/resample_by_2_internal.c \
    3rdparty/webrtc/common_audio/signal_processing/resample_fractional.c \
    3rdparty/webrtc/common_audio/vad/vad_core.c \
    3rdparty/webrtc/common_audio/vad/vad_filterbank.c \
    3rdparty/webrtc/common_audio/vad/vad_gmm.c \
    3rdparty/webrtc/common_audio/vad/vad_sp.c \
    3rdparty/webrtc/common_audio/vad/webrtc_vad.c \
    src/main.cpp \
    src/uihelper.cpp \
    src/voicerecorder.cpp

HEADERS += \
    3rdparty/webrtc/common_audio/signal_processing/dot_product_with_scale.h \
    3rdparty/webrtc/common_audio/signal_processing/resample_by_2_internal.h \
    3rdparty/webrtc/common_audio/signal_processing/include/signal_processing_library.h \
    3rdparty/webrtc/common_audio/signal_processing/include/spl_inl.h \
    3rdparty/webrtc/common_audio/vad/vad_core.h \
    3rdparty/webrtc/common_audio/vad/vad_filterbank.h \
    3rdparty/webrtc/common_audio/vad/vad_gmm.h \
    3rdparty/webrtc/common_audio/vad/vad_sp.h \
    3rdparty/webrtc/common_audio/vad/include/webrtc_vad.h \
    src/uihelper.h \
    src/voicerecorder.h

RESOURCES += \
    qml.qrc \
    resources.qrc \
    translations.qrc

TRANSLATIONS += \
    translations/pocketpiglet_de.ts \
    translations/pocketpiglet_fr.ts \
    translations/pocketpiglet_ru.ts \
    translations/pocketpiglet_zh.ts

QMAKE_CFLAGS += $$(QMAKE_CFLAGS_ENV)
QMAKE_CXXFLAGS += $$(QMAKE_CXXFLAGS_ENV)
QMAKE_LFLAGS += $$(QMAKE_LFLAGS_ENV)

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

android {
    QT += androidextras

    CONFIG(release, debug|release) {
        CONFIG += qtquickcompiler
    }

    OTHER_FILES += \
        android/source/AndroidManifest.xml \
        android/source/build.gradle \
        android/source/gradle.properties \
        android/source/gradlew \
        android/source/gradlew.bat \
        android/source/gradle/wrapper/gradle-wrapper.jar \
        android/source/gradle/wrapper/gradle-wrapper.properties \
        android/source/res/drawable/splash_qt.xml \
        android/source/res/drawable/splash_theme.xml \
        android/source/res/drawable-hdpi/ic_launcher_background.png \
        android/source/res/drawable-hdpi/ic_launcher_foreground.png \
        android/source/res/drawable-hdpi/ic_splash_qt.png \
        android/source/res/drawable-hdpi/ic_splash_theme.png \
        android/source/res/drawable-mdpi/ic_launcher_background.png \
        android/source/res/drawable-mdpi/ic_launcher_foreground.png \
        android/source/res/drawable-mdpi/ic_splash_qt.png \
        android/source/res/drawable-mdpi/ic_splash_theme.png \
        android/source/res/drawable-xhdpi/ic_launcher_background.png \
        android/source/res/drawable-xhdpi/ic_launcher_foreground.png \
        android/source/res/drawable-xhdpi/ic_splash_qt.png \
        android/source/res/drawable-xhdpi/ic_splash_theme.png \
        android/source/res/drawable-xxhdpi/ic_launcher_background.png \
        android/source/res/drawable-xxhdpi/ic_launcher_foreground.png \
        android/source/res/drawable-xxhdpi/ic_splash_qt.png \
        android/source/res/drawable-xxhdpi/ic_splash_theme.png \
        android/source/res/drawable-xxxhdpi/ic_launcher_background.png \
        android/source/res/drawable-xxxhdpi/ic_launcher_foreground.png \
        android/source/res/drawable-xxxhdpi/ic_splash_qt.png \
        android/source/res/drawable-xxxhdpi/ic_splash_theme.png \
        android/source/res/mipmap-anydpi-v26/ic_launcher.xml \
        android/source/res/mipmap-hdpi/ic_launcher.png \
        android/source/res/mipmap-mdpi/ic_launcher.png \
        android/source/res/mipmap-xhdpi/ic_launcher.png \
        android/source/res/mipmap-xxhdpi/ic_launcher.png \
        android/source/res/mipmap-xxxhdpi/ic_launcher.png \
        android/source/res/values/colors.xml \
        android/source/res/values/libs.xml \
        android/source/res/values/strings.xml \
        android/source/res/values/themes.xml \
        android/source/res/values-de/strings.xml \
        android/source/res/values-fr/strings.xml \
        android/source/res/values-ru/strings.xml \
        android/source/res/values-zh/strings.xml \
        android/source/res/xml/backup_content.xml \
        android/source/src/com/derevenetz/oleg/pocketpiglet/PigletActivity.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android/source
}
