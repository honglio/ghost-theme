/**
 * Main JS file for Casper behaviours
 */

/*globals jQuery, document */
(function ($) {
    "use strict";

    //activate deactivate website sound
    var isWebsiteSound = true;
    var soundVolume = .8; //goes from 0 to 1 (.8 means 80%)
    //sounds URL
    var soundResource = [
        {src:"/assets/sounds/sound1.mp3|/assets/sounds/sound1.ogg", id:1}
    ];

    var soundUtil;
    var queue;

        /* Sound util
    ================================================== */

    function SoundUtil(){

        this.isAvailable = function(){
            var available=true;
            if (!SoundJS.checkPlugin(true)) {
                available = false;
            }
            return available;
        }
    }

    /* End Sound util
    ================================================== */

    $(document).ready(function(){

        // On the home page, move the blog icon inside the header
        // for better relative/absolute positioning.

        //$("#blog-logo").prependTo("#site-head-content");

        // Add audio button
        $('<div id="audioButtons"><div id="a_on"><img src="/assets/images/sound_on.png" /></div><div id="a_off"><img src="/assets/images/sound_off.png" /></div></div>').appendTo('#sound-button');

        /* Add sound support
        ================================================== */

        function addSoundSupport(){
            soundStatus(false);
            //return;
            if(!isWebsiteSound){
                $('#audioButtons').remove();
                return;
            }
            SoundJS.FlashPlugin.BASE_PATH = "/assets/js/external/jquery/soundjs/" // Initialize the base path from this document to the Flash Plugin
            soundUtil = new SoundUtil();
            if(!soundUtil.isAvailable()){
                $('#audioButtons').remove();
                return;
            }
            $('#audioButtons').css('visibility', 'hidden');
            $('#a_on').css('visibility', 'hidden');
            $('#a_off').css('visibility', 'hidden');

            // Instantiate a queue.
            queue = new PreloadJS();
            queue.installPlugin(SoundJS); // Plug in SoundJS to handle browser-specific paths
            queue.onComplete = loadComplete;
            queue.onFileError = handleFileError;
            queue.loadManifest(soundResource, true);

            $('#a_on').click(function(){
                stopSound();
            });
            $('#a_off').click(function(){
                playSound(1, true);
            });
        }
        //sound on/off
        function soundStatus(val){
            if(val){
                $('#a_on').css('visibility', 'visible');
                $('#a_off').css('visibility', 'hidden');
            }else{
                $('#a_on').css('visibility', 'hidden');
                $('#a_off').css('visibility', 'visible');
            }
        }
        function handleFileError(o) {
            // An error occurred.
            $('#audioButtons').remove();
        }
        function loadComplete() {
            // Load completed.
            $('#audioButtons').css('visibility', 'visible');
            $('#a_on').css('visibility', 'visible');
            $('#a_off').css('visibility', 'visible');
            playSound(1, true);
        }
        function playSound(name, loop) {
            soundStatus(true);
            // Play the sound using the ID created above.
            var loops = 1;
            (loop)?loops=9999:null;
            return SoundJS.play(name, SoundJS.INTERRUPT_NONE, 0, 0, loops, soundVolume);
        }
        function stopSound() {
            soundStatus(false);
            if (queue != null) { queue.cancel(); }
            try{
            SoundJS.stop();
            }catch(e){}
        }


        /* End sound support
        ================================================== */

        try{
            addSoundSupport();
        }catch(e){
            //if IE
            $('#audioButtons').remove();
        }
    });

}(jQuery));