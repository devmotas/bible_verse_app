package com.example.daily_messages

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

class MainActivity : FlutterActivity() {
    private val channelName = "qrcodechannel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "sendQrCode" -> {
                    val dataJsonString = call.arguments as? String
                    if (dataJsonString != null) {
                        val dataType = object : TypeToken<HashMap<String, Any>>() {}.type
                        val dataJson: HashMap<String, Any> = Gson().fromJson(dataJsonString, dataType)
                        val intent = Intent(this, VerseDayWidget::class.java)
                        intent.action = AppWidgetManager.ACTION_APPWIDGET_UPDATE
                        intent.putExtra("data", dataJsonString)
                        sendBroadcast(intent)
                    } else {
                        result.error("INVALID_ARGUMENT", "Data is not valid JSON", null)
                    }
                }

                "installWidget" -> {
                    pinWidget()
                }

                "verifyWidgets" -> {
                    val appWidgetManager = AppWidgetManager.getInstance(this)
                    val appWidgetIds = appWidgetManager.getAppWidgetIds(
                            ComponentName(
                                    this,
                                    VerseDayWidget::class.java
                            )
                    )
                    val hasWidgets = appWidgetIds.isNotEmpty()
                    result.success(hasWidgets)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun pinWidget() {
        val appWidgetManager = AppWidgetManager.getInstance(this)
        val myProvider = ComponentName(this, VerseDayWidget::class.java)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            if (appWidgetManager.isRequestPinAppWidgetSupported) {
                val successCallback = PendingIntent.getBroadcast(
                        this,
                        0,
                        Intent(this, MainActivity::class.java),
                        PendingIntent.FLAG_IMMUTABLE
                )
                appWidgetManager.requestPinAppWidget(myProvider, null, successCallback)
            }
        }
    }
}
