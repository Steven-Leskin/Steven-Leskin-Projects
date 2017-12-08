using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirstNewDatabaseSample
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new BlogContext())

            {
                Console.Write("Enter a name for a new blog: ");
                var name = Console.ReadLine();

                var blog = new Blog { Name = name };
                db.Blogs.Add(blog);
                db.SaveChanges();

                var query = from b in db.Blogs
                    orderby b.Name
                    select b;

                foreach (var item in query)
                {
                    Console.WriteLine(item.Name);
                }
            }
        }
    }

    public class Blog
    {   public int BlogID { get; set; }
        public string Name { get; set; }

        public virtual List<Post> Posts { get; set; }
    }
        public class Post
    {
        public int PostID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int BlogID { get; set; }
        public virtual Blog Blog { get; set; }
    }

    public class BlogContext : DbContext

    {
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Post> Posts { get; set; }
    }
}
