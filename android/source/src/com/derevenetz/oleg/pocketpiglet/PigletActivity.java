package com.derevenetz.oleg.pocketpiglet;

import android.util.DisplayMetrics;

import org.qtproject.qt5.android.bindings.QtActivity;

public class PigletActivity extends QtActivity
{
    public int getScreenDpi()
    {
        DisplayMetrics metrics = getResources().getDisplayMetrics();

        return metrics.densityDpi;
    }
}
