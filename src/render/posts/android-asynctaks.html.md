---
title: "Conectando un servicio JSON en Android"
cover: '/img/android.png'
isPost: true
active: true
excerptOther: ''
postDate: '2015-10-21 20:40:00 -0400'
tags:
 - android
 - json
 - asynctaks
 - java
---

Desde hace varios años estoy dedicado a la programación móvil especialmente en la plataforma iOS, sin embargo hace unos meses entre a un Diplomado de programación móvil y como no podía ser de otra manera una de los módulo era programación para dispositivos Android.

Las tres semanas disponibles para el proyecto final fueron muy complicadas ya que tuve que no solo aprender la lógica de esta plataforma sino también entender Java (dicho sea de paso fueron mis primeras experiencia con este lenguaje de programación).

Uno de los requerimientos del proyecto final era el poder consumir un servicio json tanto para un GET como para un POST. Como siempre hay muchísima información en internet pero debido a mi poca experiencia en la plataforma me fue muy difícil entender los ejemplos.

A continuación les muestro el código que utilice que esta basado en AsyncTaks.

## GET

``` java
	private class NetworkOperationAsyncTask extends AsyncTask<Void, Void, String> {

        @Override
        protected String doInBackground(Void... params) {

            HttpURLConnection urlConnection = null;
            BufferedReader reader = null;
            Uri buildUri = Uri.parse("http://www.servicio.com").buildUpon()
                    .appendPath("file.json").build();
            try {
                URL url = new URL(buildUri.toString());

                urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setRequestMethod("GET");
                urlConnection.addRequestProperty("Content-Type", "application/json");
                urlConnection.connect();

                InputStream inputStream = urlConnection.getInputStream();
                reader = new BufferedReader(new InputStreamReader(inputStream));
                StringBuffer buffer = new StringBuffer();

                String line;
                while ((line = reader.readLine()) != null) {
                    buffer.append(line).append("\n");
                }

                return buffer.toString();
            } catch (IOException ex) {
                Log.e(LOG_TAG, ex.getMessage());
            } finally {
                try {
                    if (reader != null) {
                        reader.close();
                    }

                    if (urlConnection != null) {
                        urlConnection.disconnect();
                    }
                } catch (IOException e) {
                    Log.e(LOG_TAG, e.getMessage());
                }

            }
            return "";
        }
    }
```

## POST

``` java
	private class NetworkOperationAsyncTaskPost extends AsyncTask<Void, Void, String> {

        @Override
        protected String doInBackground(Void... params) {
            URL url;
            HttpURLConnection connection = null;
            Uri buildUri = Uri.parse("http://www.servicio.com").buildUpon()
                    .appendPath("file.json").build();
            try {

                url = new URL(buildUri.toString()); // Create a new URL
                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST");
                connection.setRequestProperty("Content-Type", "application/json");
                connection.setRequestProperty("Accept-Language", "en-us");
                connection.setUseCaches(false);
                connection.setDoInput(true);
                connection.setDoOutput(true);
                connection.connect();


                DataOutputStream wr = new DataOutputStream(connection.getOutputStream());

                byte[] outputBytes = jsonWorkPost.toString().getBytes("UTF-8");

                wr.write(outputBytes);
                wr.flush();
                wr.close();

                //Get Response
                InputStream is = connection.getInputStream();
                BufferedReader rd = new BufferedReader(new InputStreamReader(is));
                String line;
                StringBuffer response = new StringBuffer();
                while ((line = rd.readLine()) != null) {
                    response.append(line);
                    response.append('\r');
                }
                rd.close();
                return response.toString();

            } catch (Exception e) {

                e.printStackTrace();
                return null;

            } finally {

                if (connection != null) {
                    connection.disconnect();
                }
            }
        }
    }
```



