# Keep everything related to Dio
-keep class okhttp3.** { *; }
-keep class okio.** { *; }
-keep class retrofit2.** { *; }
-keep class com.google.gson.** { *; }

# Preserve annotations
-keepattributes *Annotation*

# Keep model classes (if you use Gson, JsonSerializable, etc.)
-keepclassmembers class ** {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Prevent obfuscation of your app's main classes
-keep class com.example.yourapp.** { *; }
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivity$g
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Args
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Error
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningEphemeralKeyProvider