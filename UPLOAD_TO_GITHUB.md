# Upload this project to GitHub

## Use the GitHub website

1. Unzip `LSDE-Week5-AWS-S3-EC2-RDS.zip` on your Mac.
2. Open the extracted `LSDE-Week5-AWS-S3-EC2-RDS` folder. `README.md`, `data`,
   `assets`, `docs`, `scripts` and `sql` should be directly inside it.
3. Sign in at [GitHub](https://github.com) and select **New repository**.
4. Use a name such as `LSDE-Week5-AWS-S3-EC2-RDS`. Add this description:

   > Illustrated AWS Academy practical: S3 file transfers, EC2 SSH and RDS MySQL CSV imports.

5. Choose your repository visibility. Create an empty repository without adding
   another README, license or gitignore during repository creation.
6. On the empty repository page, select **uploading an existing file**. In an
   existing repository, use **Add file > Upload files**.
7. Drag the **contents of the extracted folder** into the upload area. Keep the
   `assets`, `data`, `docs`, `sql` and `scripts` subfolders intact. Upload the
   extracted contents so GitHub can display the README and its images.
8. Finder hides `.gitignore` and `.gitattributes`. Press **Command + Shift + .**
   to reveal them and include both in the upload.
9. Enter a commit message such as `Add illustrated AWS Week 5 workshop guide`
   and select **Commit changes**.
10. Open the repository's main page. Confirm the README renders, all screenshots
    load, and its PDF and dataset links open. `README.md` should be at the root.

The website supports uploading files and folders; its per-file limit is 25 MiB.
Every file in this package is below that limit. See the
[official upload instructions](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository).

## Optional: upload with Git

Create an empty GitHub repository first. In Mac Terminal, replace the username
and path below. Run these from inside the extracted project folder:

```bash
cd ~/Downloads/LSDE-Week5-AWS-S3-EC2-RDS
git init
git add .
git commit -m "Add illustrated AWS Week 5 workshop guide"
git branch -M main
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/LSDE-Week5-AWS-S3-EC2-RDS.git
git push -u origin main
```

Authenticate using GitHub's supported sign-in method when prompted. Keep your
EC2 key, RDS password and AWS credentials outside the project folder.

## Suggested repository topics

`aws` `amazon-s3` `amazon-ec2` `amazon-rds` `mysql` `sql` `aws-academy` `data-engineering`
