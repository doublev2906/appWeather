package com.example.app_weather

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.graphics.Bitmap
import android.graphics.Color
import android.widget.ImageView
import android.widget.RemoteViews
import androidx.core.widget.RemoteViewsCompat.setViewBackgroundColor
import androidx.core.widget.RemoteViewsCompat.setViewBackgroundResource
import com.bumptech.glide.Glide
import com.bumptech.glide.request.RequestOptions
import com.bumptech.glide.request.target.AppWidgetTarget
import com.bumptech.glide.request.transition.Transition
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

class AppWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.weather_home).apply {

                // Open App on Widget Click
                val pendingIntent = HomeWidgetLaunchIntent.getActivity(
                    context,
                    MainActivity::class.java
                )
                setOnClickPendingIntent(R.id.widget_root, pendingIntent)

                val temp = widgetData.getString("temp", "")
                val imageUrl = widgetData.getString("imageUrl", "")
                val des = widgetData.getString("des", "")
                val location = widgetData.getString("location", "")
                val isDay = widgetData.getBoolean("isDay", false)
                setTextViewText(R.id.tv_tempC, temp)
                setTextViewText(R.id.tv_des, des)
                setTextViewText(R.id.tv_location, location)
                if (!isDay){
                    setViewBackgroundResource(R.id.child_root,R.drawable.background_home_widget_dark)
                    setTextColor(R.id.tv_tempC,0xfffafafa.toInt())
                    setTextColor(R.id.tv_des,0xfffafafa.toInt())
                    setTextColor(R.id.tv_location,0xfffafafa.toInt())
                    setTextColor(R.id.tv_C,0xfffafafa.toInt())
                }else{
                    setViewBackgroundResource(R.id.child_root, R.drawable.background_home_widget)
                    setTextColor(R.id.tv_tempC,0xff1D212C.toInt())
                    setTextColor(R.id.tv_des,0xff1D212C.toInt())
                    setTextColor(R.id.tv_location,0xff1D212C.toInt())
                    setTextColor(R.id.tv_C,0xff1D212C.toInt())
                }


                val awt: AppWidgetTarget = object : AppWidgetTarget(context.applicationContext, R.id.icon, this, *appWidgetIds) {
                    override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
                        super.onResourceReady(resource, transition)
                    }
                }

                val options = RequestOptions().
                override(500, 500).placeholder(R.drawable.loading)

                Glide.with(context.applicationContext).asBitmap().load(imageUrl).apply(options).into(awt)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}