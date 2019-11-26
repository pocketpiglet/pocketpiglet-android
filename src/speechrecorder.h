#ifndef SPEECHRECORDER_H
#define SPEECHRECORDER_H

#include <memory>

#include <QtCore/QtGlobal>
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QByteArray>
#include <QtMultimedia/QAudioInput>

#include "webrtc/common_audio/vad/include/webrtc_vad.h"

class SpeechRecorder : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool    active               READ active               WRITE setActive               NOTIFY activeChanged)
    Q_PROPERTY(int     minVoiceDuration     READ minVoiceDuration     WRITE setMinVoiceDuration     NOTIFY minVoiceDurationChanged)
    Q_PROPERTY(int     minSilenceDuration   READ minSilenceDuration   WRITE setMinSilenceDuration   NOTIFY minSilenceDurationChanged)
    Q_PROPERTY(qreal   volume               READ volume               WRITE setVolume               NOTIFY volumeChanged)
    Q_PROPERTY(qreal   sampleRateMultiplier READ sampleRateMultiplier WRITE setSampleRateMultiplier NOTIFY sampleRateMultiplierChanged)

    Q_PROPERTY(QString voiceFileURL         READ voiceFileURL)

public:
    explicit SpeechRecorder(QObject *parent = nullptr);

    SpeechRecorder(const SpeechRecorder &) = delete;
    SpeechRecorder(SpeechRecorder &&) noexcept = delete;

    SpeechRecorder &operator=(const SpeechRecorder &) = delete;
    SpeechRecorder &operator=(SpeechRecorder &&) noexcept = delete;

    ~SpeechRecorder() noexcept override;

    bool active() const;
    void setActive(bool active);

    int minVoiceDuration() const;
    void setMinVoiceDuration(int duration);

    int minSilenceDuration() const;
    void setMinSilenceDuration(int duration);

    qreal volume() const;
    void setVolume(qreal volume);

    qreal sampleRateMultiplier() const;
    void setSampleRateMultiplier(qreal multiplier);

    QString voiceFileURL() const;

private slots:
    void handleAudioInputDeviceReadyRead();

signals:
    void activeChanged(bool active);
    void minVoiceDurationChanged(int minVoiceDuration);
    void minSilenceDurationChanged(int minSilenceDuration);
    void volumeChanged(qreal volume);
    void sampleRateMultiplierChanged(qreal sampleRateMultiplier);
    void error(const QString &errorString);
    void voiceFound();
    void voiceRecorded();
    void voiceReset();

private:
    void Cleanup();

    void CreateAudioInput();
    void DeleteAudioInput();

    void CreateVAD();
    void DeleteVAD();

    void SaveVoice();

    bool                         Active, VoiceDetected;
    int                          MinVoiceDuration, MinSilenceDuration,
                                 SilenceSize;
    qreal                        Volume, SampleRateMultiplier;
    QString                      VoiceFilePath;
    QByteArray                   AudioBuffer, VoiceBuffer;
    VadInst                     *VadInstance;
    std::unique_ptr<QAudioInput> AudioInput;
};

#endif // SPEECHRECORDER_H