#include "apirest.h"

ApiRest::ApiRest(QObject *parent)
    : QObject(parent)
{
QObject::connect(&m_NetworkAccessManager, SIGNAL(finished(QNetworkReply *)), this, SLOT(onRestApiFinished(QNetworkReply*)));
}

QJsonObject ApiRest::JsonData() const
{
    return m_JsonData;
}

void ApiRest::setJsonData(const QJsonObject& data)
{
    m_JsonData = data;
    emit dataChanged(m_JsonData);
}

void ApiRest::restApiRequest()
{
    QNetworkRequest request;
    /*first create an accuweather app with limited trial, generate api key, then go tolocation api,  https://developer.accuweather.com/accuweather-locations-api/apis/get/locations/v1/adminareas/%7BcountryCode%7D paste MK into {countryCode} and the ID of the city is generated, to get the country code go to regionlist and paste the api key, continents id will be generated, then to country list and admin area list*/

    QUrl url("http://dataservice.accuweather.com/forecasts/v1/daily/5day/85?apikey=YOUR_API_KEY");

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setUrl(url);
    m_NetworkAccessManager.get(request);

}

void ApiRest::onRestApiFinished(QNetworkReply *reply)
{
    QJsonDocument jsdoc = QJsonDocument::fromJson(reply -> readAll());
    setJsonData(jsdoc.object());
    QByteArray docByteArray = jsdoc.toJson(QJsonDocument::Compact);
    qDebug()<<QLatin1String(docByteArray);
}
