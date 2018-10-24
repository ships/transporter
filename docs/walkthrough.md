# Walkthrough

## About

By following this guide, you will be given (hopefully) clear steps and minimal requirements to get your HAUBERK up and useful. I will try to reference out to helpful context and explanations throughout.

Working with a command line interface (CLI) is famously unpopular and unintuitive to someone who hasn't done it before. This is an unsolved problem that I won't try to address yet, but I do believe it is worth reading about [why power-users of computers tend to gravitate towards them](..) instead of point-and-click systems. As HAUBERK is made to help normal people get the same kind of service from their machines as power-users, I am compelled to design its user flow proximate to CLI work styles, even though I want to avoid making "terminal fluency" a requirement for its use.

This guide should ideally get you from a "green field" (no advance preparation) to using a basic secure service that you own and control.

## Steps

### 0. Prerequisites

At a minimum, this will need to involve abandoning browser-based interactions (which are about as far away from the CLI end of the pool as you can get, regarding the benefits linked to above) as soon as possible. Once we can cross that bridge, you can start to let the tools/scripts baked into this project do all the heavy lifting. The steps in this section are largely preparatory setup to get you to that point.

#### i. An account on GCP (Google Cloud Platform).

This transporter is designed to behave like a rainstick: you should be able to tip most of the work you need done into machines you trust and own, or into the cloud, in flexible measure according to your own preferences. However, at the moment for networking reasons you will need a small suite of software running in the cloud, to permit all your devices to communicate across long distances.

For simplicity, I am only focusing on out-of-the-box compatibility with Google. Though there is competition in this space, Google's interface layout is easier to understand and use for a non-technical person (it seems). Everything should work cross-platform with various competitors but, in service to a usable walkthrough, I will keep this document focused.

Signing up for stuff is designed to require human assistance, so you'll need to do this bit yourself, to get started with Google in a web browser:

   	1. Visit [https://console.cloud.google.com](https://console.cloud.google.com) and begin your free trial (if you don't have a Google account, such as for Gmail, you'll have to set one up now). This trial should come with enough credit for you to operate a TRANSPORTER for a few months at least to see whether that appeals to you.
   	2. The sandwich menu on the top-left should show you a huge list of services. The one we want, as of this writing, is called **IAM & admin**. Click that.
   	3. Select **Service accounts** from the sidebar menu.
   	4. Choose **Create service account**
          	1. On the first section, **Service account details**, fill in descriptive info if you want. I chose the name _bbl-user_ for reasons that may be clear later.
          	2. On the second section, **Service account permissions** (this is where detail matters), select the role **Project -> Editor**.
          	3. The third section doesn't matter for our purposes.
   	5. You should see this new account appear in a table. On the right edge of the table (you may have to **Hide info panel**), you will see an **Actions** column, with an icon you can click, and choose **Create key**. Choose **JSON**.

This will need to download a _secret key_ for the new service account user. This is needed because you will use it to allow the transporter scripts to make changes to your GCP account on your behalf. Note that a `something.json` file should have appeared in your Downloads directory (found in Dock or Finder).

#### ii. preparing your home computer or laptop

Here we'll begin your crash course in using your computer's advanced features. You will run a few commands using the **Terminal** application. Though a lot is going on in these commands, I've tried to reduce the interface to some basic steps for you.

1. In your **Terminal** window, copy and paste all this text:

   ```bash
   mkdir -p ~/workspace
   cd !$
   git clone https://github.com/ships/transporter transporter
   cd !$
   ls
   ```

   That's this repository! You now have a copy of all these files in that directory. You have also set that directory to your "current directory", which you can think of as the place where your cursor is in a document, except it's in a big structured building instead of just one page. To confirm it worked, the final output from that stuff should resemble the list of folders you see in this repository.

2. Next, you will need to run this command to set up some required software:

   ```bash
   scripts/dependencies.sh
   ```

   You should see some output installing software on your machine. For me, the last output I see is like the following, which indicates that things were properly installed, but you still haven't gotten to Stage 1 (Setting up the hub):

   ```
   Read jumpbox vars file: open <long path to a file>: no such file or directory
   direnv: export <a bunch of variables>
   ```
