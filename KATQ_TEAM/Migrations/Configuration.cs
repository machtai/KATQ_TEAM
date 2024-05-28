namespace KATQ_TEAM.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<KATQ_TEAM.Models.Qldienthoai>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(KATQ_TEAM.Models.Qldienthoai context)
        {
        }
    }
}
