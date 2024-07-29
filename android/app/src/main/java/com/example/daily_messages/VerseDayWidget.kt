package com.example.daily_messages

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.view.View
import android.widget.RemoteViews
import android.widget.Toast
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

class VerseDayWidget : AppWidgetProvider() {

    private val PREF_NAME = "widget_data"

    override fun onReceive(context: Context?, intent: Intent?) {
        super.onReceive(context, intent)
        val prefs = context?.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
        val data = intent?.getStringExtra("data")
        if (data != null) {
            prefs?.edit()?.putString("external_data", data)?.apply()
        }
        if (intent?.action == AppWidgetManager.ACTION_APPWIDGET_ENABLED) {
            val toast = Toast.makeText(
                    context,
                    context!!.getString(R.string.widget_installed_success), Toast.LENGTH_LONG
            )
            toast.show()
        }
        if (data != null) {
            val dataType = object : TypeToken<HashMap<String, Any>>() {}.type
            val dataMap: HashMap<String, Any> = Gson().fromJson(data, dataType)
                      if (data.isNotEmpty()) {
                updateWidget(context, dataMap)
            } else {
                updateWidgetWithMessage(context)
            }
        }
    }

    private fun updateWidget(context: Context?, data: Map<String, Any>) {
        val views = RemoteViews(context?.packageName, R.layout.verse_day_widget)
        val book = data["book"] as? Map<*, *> ?: return
        val author = book["author"] as? String ?: ""
        val bookName = book["name"] as? String ?: ""
        val chapter = data["chapter"] as? Number
        val number = data["number"] as? Number
        val titleString = context?.getString(R.string.day_verse_title) ?: ""
        val formattedChapter = chapter?.toInt().toString()
        val formattedNumber = number?.toInt().toString()

        val title = if (author == "Desconhecido") {
            "$bookName - $formattedChapter:$formattedNumber"
        } else {
            "$author - $formattedChapter:$formattedNumber"
        }

        views.setViewVisibility(R.id.day_verse_title, View.VISIBLE)
        views.setViewVisibility(R.id.verse_text, View.VISIBLE)
        views.setViewVisibility(R.id.refresh_button, View.VISIBLE)
        views.setTextViewText(R.id.day_verse_title,    title)
        views.setTextViewText(R.id.verse_text, data["text"].toString())

        val pendingIntentWidgetLayout = context?.let { getPendingIntent(it) }
        views.setOnClickPendingIntent(R.id.verse_day_widget_layout, pendingIntentWidgetLayout)
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val thisWidget = ComponentName(context!!, VerseDayWidget::class.java)
        appWidgetManager.updateAppWidget(thisWidget, views)
    }

    private fun updateWidgetWithMessage(context: Context?) {
        val views = RemoteViews(context?.packageName, R.layout.verse_day_widget)
        views.setTextViewText(R.id.verse_text, context?.getString(R.string.open_app_to_refresh) ?: "")
        views.setViewVisibility(R.id.day_verse_title, View.GONE)
        views.setViewVisibility(R.id.verse_text, View.VISIBLE)
        views.setViewVisibility(R.id.refresh_button, View.GONE)
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val thisWidget = ComponentName(context!!, VerseDayWidget::class.java)
        appWidgetManager.updateAppWidget(thisWidget, views)
    }

    private fun getPendingIntent(context: Context): PendingIntent? {
        val intent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        return PendingIntent.getActivity(
                context, 0, intent,
                PendingIntent.FLAG_MUTABLE
        )
    }
}
