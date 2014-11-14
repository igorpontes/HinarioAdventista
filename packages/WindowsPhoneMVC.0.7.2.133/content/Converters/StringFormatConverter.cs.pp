using System;
using System.Globalization;
using System.Windows.Data;

namespace $rootnamespace$.Converters
{
    public class StringFormatConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var format = parameter as string;

            if (format == null)
                return value;

            return string.Format(format, value);
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }
}