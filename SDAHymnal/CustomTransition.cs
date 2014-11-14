using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;

namespace SplashScreenTransition
{
    public class CustomTransition : ITransition

    {
        Storyboard storyboard;

        public CustomTransition(Storyboard sb)
        {
            storyboard = sb;
        }

        // these are used by the transition

        public void Begin()
        {
            storyboard.Begin();
        }

        public event EventHandler Completed
        {
            add
            {
                storyboard.Completed += value;
            }
            remove
            {
                storyboard.Completed -= value;
            }
        }

        // not used for SplashScreen, but needed to create the whole animation
        // if you don´t add these, you will not be able to build your project
        
        public void Stop()
        {
            storyboard.Stop();
        }

        public void Pause()
        {
            storyboard.Pause();
        }

        public void Resume()
        {
            storyboard.Resume();
        }

        public void SkipToFill()
        {
            storyboard.SkipToFill();
        }

        public void Seek(TimeSpan offset)
        {
            storyboard.SeekAlignedToLastTick(offset);
        }

        public void SeekAlignedToLastTick(TimeSpan offset)
        {
            storyboard.SeekAlignedToLastTick(offset);
        }

        public ClockState GetCurrentState()
        {
            return storyboard.GetCurrentState();
        }

        public TimeSpan GetCurrentTime()
        {
            return storyboard.GetCurrentTime();
        }
    }
}
