using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CarLibrary
{
    public class SportsCar : Car
    {
        public SportsCar() { }
        public SportsCar(string name, int maxSp, int currSp) 
            : base(name, maxSp, currSp) { }
        public override void TurbooBoost()
        {
            MessageBox.Show("Faster is better...", "Ramming speed!");
        }
    }
}
