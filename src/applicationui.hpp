#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <bb/device/DisplayInfo>

namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}

class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI(bb::cascades::Application *app);
    virtual ~ApplicationUI() { };
    // Converts the passed QString to an UTF-8 encoded QByteArray
    Q_INVOKABLE QByteArray encodeQString(const QString& toEncode) const;
private slots:
    void onSystemLanguageChanged();
private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
};

#endif /* ApplicationUI_HPP_ */
