package com.test.myapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.test.mysubmodule1.SubModule1
import com.test.mysubmodule2.SubModule2
import com.test.mysubmodule3.SubModule3

class MainActivity : AppCompatActivity() {
    val m1 = SubModule1()
    val m2 = SubModule2()
    val m3 = SubModule3()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        Log.e("MainActivity", "m1 name: ${m1.getSubModuleName()}")
        Log.e("MainActivity", "m2 name: ${m2.getSubModuleName()}")
        Log.e("MainActivity", "m3 name: ${m3.getSubModuleName()}")

    }
}