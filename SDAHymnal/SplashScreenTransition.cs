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
    public class SplashScreenTransition : TransitionElement
    {
        public override ITransition GetTransition(UIElement element)
        {
            Storyboard FadingStoryBoard = CreateStoryBoard(1.0, 0.0);
            Storyboard.SetTarget(FadingStoryBoard, element);
            return new CustomTransition(FadingStoryBoard);
        }

        private Storyboard CreateStoryBoard(double from, double to)
        {
            Storyboard result = new Storyboard();
            DoubleAnimation animation = new DoubleAnimation();
            animation.From = from;
            animation.To = to;
            Storyboard.SetTargetProperty(animation, 
                new PropertyPath(UIElement.OpacityProperty));
            result.Children.Add(animation);
            return result;
        }

    }
}
