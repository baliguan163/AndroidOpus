package com.example.androidopus;

public class OpusTool {  
	  
    private static final String TAG = OpusTool.class.getName();  
    static {  
        try {  
            System.loadLibrary("opustool");  
            Log.e(TAG, "loaded library ");  
        } catch (UnsatisfiedLinkError e) {  
            Log.e(TAG, "Could not load library ");  
    }  
  
    private native String nativeGetString();  
    private native int encode_wav_file(String wav_path, String opus_path);  
    private native int decode_opus_file(String opus_path, String wav_path);  
    
    public String getNativeString() {  
        return nativeGetString();  
    }  
    public int encode(String wav_path, String opus_path) {  
        return encode(wav_path, opus_path);  
    }  
    public int decode(String opus_path, String wav_path) {  
        return decode_opus_file(opus_path, wav_path);  
    }  
}  