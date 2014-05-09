﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Wypozyczalnia.View
{
    public partial class ReservationsView : Wypozyczalnia.View.BaseView
    {
        public ReservationsView()
        {
            InitializeComponent();
        }

        public int GetActiveElementId()
        {
            int index = dataGridView1.CurrentRow.Index;
            int CurrentId = Convert.ToInt32(dataGridView1[0, index].Value);

            return CurrentId;
        }

        /// <summary>
        /// Pobranie z tabeli danych i utworzenie niepelnego obiektu Rezerwacja
        /// </summary>
        /// <returns></returns>
        public Rezerwacja GetActiveElement()
        {
            try
            {
                DateTime? Date;
                int index = dataGridView1.CurrentRow.Index;
                if (!String.IsNullOrEmpty(dataGridView1[6, index].Value.ToString()))
                {
                    Date = Convert.ToDateTime(dataGridView1[6, index].Value);
                }
                else
                {
                    Date = null;
                }
                return new Rezerwacja()
                {
                    Rezerwacja_ID = Convert.ToInt32(dataGridView1[0, index].Value),
                    Data_wypożyczenia = Convert.ToDateTime(dataGridView1[5, index].Value),
                    Data_zwrotu = Date
                };
            }
            catch (FormatException ex)
            {
                return null;
            }
        }

        public override void SetColumnsWidth()
        {
            try
            {
                double width = dataGridView1.Width - 20;
                dataGridView1.Columns[0].Width = (int)(0.1 * width);
                dataGridView1.Columns[1].Width = (int)(0.15 * width);
                dataGridView1.Columns[2].Width = (int)(0.15 * width);
                dataGridView1.Columns[3].Width = (int)(0.15 * width);
                dataGridView1.Columns[4].Width = (int)(0.15 * width);
                dataGridView1.Columns[5].Width = (int)(0.15 * width);
                dataGridView1.Columns[6].Width = (int)(0.15 * width);
                dataGridView1.Columns[7].Width = (int)(0.15 * width);
            }
            catch (ArgumentOutOfRangeException ex)
            {

            }
        }

        public string FilterSurname
        {
            get { return filterSurname.Text; }
        }

        private void ActionAdd(object sender, EventArgs e)
        {
            controller.ShowReservationAddForm();
        }

        private void ActionEdit(object sender, EventArgs e)
        {
            controller.ShowReservationEditForm();
        }

        private void ActionDelete(object sender, EventArgs e)
        {
            if (dataGridView1.RowCount > 1)
            {
                controller.DeleteReservation();
            }
        }

        private void ActionResized(object sender, EventArgs e)
        {
            SetColumns();
        }

        private void ActionSearchBySurname(object sender, EventArgs e)
        {
            controller.SearchReservationsBySurname();
        }

        private void ActionShowEmploees(object sender, EventArgs e)
        {
            if (dataGridView1.RowCount > 1)
            {
                controller.ShowReservationEmploeesForm();
            }
        }
    }
}
